function [data, auxData, metaData, txtData, weights] = mydata_Gastrosaccus_roscoffensis

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Gastrosaccus_roscoffensis'; 
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 27]; 

%% set data
% zero-variate data

data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.269;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'EscaRier2012';  
data.Lp  = 0.83;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length compared to Praunus: 1.8/2.6*1.2';
data.Li  = 1.2;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'EscaRier2012';

data.Wdb = 4.17e-5;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'based on (Lb/Li)^3*Wdi';
data.Wdp = 1.2e-3;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'guess';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 3.7e-3;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Mysis mixta: (1.2/1.470)^3*6.8e-3';
 
data.Ri  = 0.64;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since Jan 1 (d), standard length (cm)
0.114	0.269
6.034	0.340
12.865	0.525
19.924	0.744
27.097	0.757
34.269	0.850
41.784	0.963
49.070	1.019
57.040	1.011];  
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EscaRier2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K9TM'; % Cat of Life
metaData.links.id_ITIS = '90387'; % ITIS
metaData.links.id_EoL = '342717'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Gastrosaccus_roscoffensis'; % ADW
metaData.links.id_Taxo = '389994'; % Taxonomicon
metaData.links.id_WoRMS = '120018'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mysidae}}';
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
bibkey = 'EscaRier2012'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v38i3.1989}, ' ...
'author = {A. Esc\''{a}nez and R. Riera and L. M\''{a}rquez and A. Skalli and B. C. Felipe and I. Garc\''{i}a-Herrero and D. Reis and C. Rodr\''{i}guez and E. Almansa}, ' ... 
'year = {2012}, ' ...
'title = {A general survey of the feasibility of culturing the mysid \emph{Gastrosaccus roscoffensis} ({P}eracarida, {M}ysida): Growth, survival, predatory skills, and lipid composition}, ' ...
'journal = {Ciencias Marinas (), : }, ' ...
'volume = {38}, ' ...
'pages = {475-490}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
