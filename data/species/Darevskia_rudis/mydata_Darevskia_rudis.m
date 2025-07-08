function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_rudis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_rudis'; 
metaData.species_en = 'Spiny tailed lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.3); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_Tf'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 13];

%% set data
% zero-variate data

data.tp = 1.5*365;     units.tp = 'd';    label.tp = 'age at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(19); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'GulOzde2014';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.9;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';     bibkey.Lb  = 'guess';
data.Li  = 8.5;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';        bibkey.Li  = 'guess';  
data.Lim = 8.4;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';       bibkey.Lim = 'guess';  

data.Wwi = 17.38;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(12.3);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lacerta strigata, temp corrected';

% univariate data
% time-length
data.tL_C = [ ... % time since birth (yr), SVL (cm): females, males
5	7.272 7.043
6	7.009 7.875
7	7.764 8.299
8	7.959 8.112];
data.tL_C(:,1) = data.tL_C(:,1) * 365; % convert yr to d
units.tL_C  = {'d', 'cm'};  label.tL_C = {'time since birth', 'SVL'};  
temp.tL_C   = C2K(25);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'GulOzde2014'; treat.tL_C = {1, {'females','males'}};
comment.tL_C = 'Data for females, males from Cermik, 700 m alt';
%
data.tL_B = [ ... % time since birth (yr), SVL (cm): females, males
4	6.457 6.560
5	6.430 5.961
6	7.199 7.607
7	7.519 NaN];
data.tL_B(:,1) = data.tL_B(:,1) * 365; % convert yr to d
units.tL_B  = {'d', 'cm'};  label.tL_B = {'time since birth', 'SVL'};  
temp.tL_B = C2K(22);  units.temp.tL_B = 'K'; label.temp.tL_B = 'temperature';
bibkey.tL_B = 'GulOzde2014'; treat.tL_B = {1, {'females','males'}};
comment.tL_B = 'Data for females, males from Borkca, 1277 m alt';
%
data.tL_A = [ ... % time since birth (yr), SVL (cm): females, males
3   NaN   5.766
4	6.193 5.746
5	6.782 6.416
6	7.046 NaN];
data.tL_A(:,1) = data.tL_A(:,1) * 365; % convert yr to d
units.tL_A  = {'d', 'cm'};  label.tL_A = {'time since birth', 'SVL'};  
temp.tL_A = C2K(19);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
bibkey.tL_A = 'GulOzde2014'; treat.tL_A = {1, {'females','males'}};
comment.tL_A = 'Data for females, males from Ardanuc, 2137 m a';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_A = 3 * weights.tL_A;
weights.tL_B = 3 * weights.tL_B;
weights.tL_C = 3 * weights.tL_C;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6CCHH'; % Cat of Life
metaData.links.id_ITIS = '1155284'; % ITIS
metaData.links.id_EoL = '792793'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_rudis'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_rudis'; % ADW
metaData.links.id_Taxo = '642537'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=rudis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_rudis}}';
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
bibkey = 'GulOzde2014'; type = 'Article'; bib = [ ... 
'author = {Serkan G\"{u}l and Nurhayat \"{O}zdem{\i}r and Yusuf Kumluta\c{s} and \c{C}etin Ilgaz}, ' ... 
'year = {2014}, ' ...
'title = {Age structure and body size in three populations of \emph{Darevskia rudis} ({B}ediagra, 1886) from different altitudes ({S}quamata: {S}auria: {L}acertidae)}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {26(3/4)}, ' ...
'pages = {151-158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792793}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
