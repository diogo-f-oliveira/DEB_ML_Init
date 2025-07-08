function [data, auxData, metaData, txtData, weights] = mydata_Elusor_macrurus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Elusor_macrurus'; 
metaData.species_en = 'Mary River turtle';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 56;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Limp2008';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 15*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Limp2008';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 15*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Limp2008';
  temp.tpm = C2K(23);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Limp2008';
data.Lp = 29; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Limp2008';
data.Lpm = 27; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';      bibkey.Lpm = 'Limp2008';
data.Li = 31.72; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Limp2008';
data.Lim = 37.47; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Limp2008';

data.Wwi = 3.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on CL 24.6 corresponds with 1785 g for Myuchelys_bellii: (31.7/24.7)^3*1785';

data.Ri  = 14.7/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at CL 24.6';   bibkey.Ri  = 'Limp2008';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean of 14.7 eggs per clutch, 1 clutch per yr';
 
% uni-variate data

% time-length
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.000	2.999
1.997	12.315
2.016	10.868
2.016	11.385
2.036	10.248
3.022	11.288
3.022	12.322
3.023	13.355
3.023	14.079
3.023	14.699
3.024	15.629
4.049	14.396
5.016	17.813
5.016	18.330
5.016	19.054
7.047	19.274];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Limp2008';
comment.tL_m = 'Data for males from Mary River';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_m'}; subtitle1 = {'Data for males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '6F6JF'; % Cat of Life
metaData.links.id_ITIS = '949505'; % ITIS
metaData.links.id_EoL = '794866'; % Ency of Life
metaData.links.id_Wiki = 'Elusor_macrurus'; % Wikipedia
metaData.links.id_ADW = 'Elusor_macrurus'; % ADW
metaData.links.id_Taxo = '640654'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Elusor&species=macrurus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elusor_macrurus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Limp2008'; type = 'Techreport'; bib = [ ... 
'doi = {10.1071/ZO14070}, ' ...
'author = {Limpus, Col.}, ' ... 
'year = {2008}, ' ...
'title = {Freshwater Turtles in the {M}ary {R}iver: {R}eview of biological data for turtles in the {M}ary {R}iver, with emphasis on \emph{Elusor macrurus} and \emph{Elseya albagula}}, ' ...
'institution = {Brisbane: Queensland Government}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794866}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

