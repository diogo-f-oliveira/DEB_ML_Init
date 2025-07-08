function [data, auxData, metaData, txtData, weights] = mydata_Elseya_albagula
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Elseya_albagula'; 
metaData.species_en = 'White-throated snapping turtle';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bFm', 'biTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
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

data.ab28 = 85;     units.ab28 = 'd';    label.ab28 = 'age at birth';           bibkey.ab28 = 'Limp2008';   
  temp.ab28 = C2K(28);  units.temp.ab28 = 'K'; label.temp.ab28 = 'temperature';
data.ab30 = 77;     units.ab30 = 'd';    label.ab30 = 'age at birth';           bibkey.ab30 = 'Limp2008';   
  temp.ab30 = C2K(30);  units.temp.ab30 = 'K'; label.temp.ab30 = 'temperature';
data.tp = 10.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Limp2008';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 9.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Limp2008';
  temp.tpm = C2K(23);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 4.9; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Limp2008';
data.Lp = 25.2; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Limp2008';
data.Lpm = 20.8; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';      bibkey.Lpm = 'Limp2008';
data.Li = 36; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Limp2008';
data.Lim = 24; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'Limp2008';

data.Ww0 = 31.8; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'Limp2008';
data.Wwi = 5.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on CL 24.6 corresponds with 1785 g for Myuchelys_bellii: (36/24.7)^3*1785';

data.Ri  = 13.8/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at CL 24.6';   bibkey.Ri  = 'Limp2008';   
  temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mean of 13.8 eggs per clutch, 1 clutch per yr';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
2.038	7.908
2.040	9.742
2.041	10.315
2.042	11.003
2.123	4.814
3.097	8.138
3.099	10.201
3.100	10.888
4.033	16.275
4.116	12.034
4.119	14.900
4.246	9.971
5.046	14.785
5.091	15.702
5.174	11.003
6.151	17.077
6.153	18.567
7.169	19.484
8.139	19.140
8.936	22.350
9.200	20.974
10.126	20.974
10.132	26.361
11.098	21.891
11.099	22.808
11.100	23.840
11.106	29.341
12.164	28.653
13.085	24.069
14.107	30.602
15.074	27.278
15.167	31.060
16.002	28.883
17.108	31.404
17.144	24.298
28.052	33.467
29.113	35.41];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Limp2008';
comment.tL_f = 'Data for females from Mary River';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
3.057	11.920
7.165	16.619
8.097	21.547
8.978	19.713
9.109	19.026
10.083	22.235
14.052	20.401
14.054	22.235];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Limp2008';
comment.tL_m = 'Data for males from Mary River';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '39CXX'; % Cat of Life
metaData.links.id_ITIS = '949501'; % ITIS
metaData.links.id_EoL = '789790'; % Ency of Life
metaData.links.id_Wiki = 'Elseya_albagula'; % Wikipedia
metaData.links.id_ADW = 'Elseya_albagula'; % ADW
metaData.links.id_Taxo = '3810384'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Elseya&species=albagula'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elseya_albagula}}';
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
'howpublished = {\url{https://eol.org/pages/789790}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

