function [data, auxData, metaData, txtData, weights] = mydata_Reinhardtius_hippoglossoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Reinhardtius_hippoglossoides'; 
metaData.species_en = 'Greenland halibut'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 03 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.6;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'access';
data.Lj  = 6;     units.Lj  = 'cm';  label.Lj  = 'length at metam';   bibkey.Lj  = 'access';
data.Lp  = 62.5;  units.Lp  = 'cm';  label.Lp  = 'length at pubert';  bibkey.Lp  = 'fishbase';
data.Li  = 130;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 110;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 0.0335; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'access';
  comment.Wwb = 'based on egg diameter 3.6 to 4.7 mm: 4/3*pi*0.02^3';
data.Wwi = 23.2e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00387*Li^3.206';
data.Wwim = 13.5e3;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00387*Lim^3.206';
  
data.Ri  = 3e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data females 
data.tL_f = [... % time since birth (yr), total length (cm)
 0   9.2
 1  13.5
 2  17.1
 3  22.5
 4  27.4
 5  34.7
 6  42.2
 7  48.4
 8  54
 9  64.5
10  60.8
11  62
12  71
13  74.2
14  86.2
15  86.4
16  81.4
17  77
18  78
19  78
21  92
22  89
23  85
24  85
26 104
27  84.5
30  88
33 109];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DwyeTreb2016';
comment.tL_f = 'Data for females';
% t-L data males 
data.tL_m = [... % time since birth (yr), total length (cm)
 0  9.0
 2 16.4
 3 22.9
 4 28.6
 5 35.4
 6 40
 7 45.2
 8 52.6
 9 58.1
10 59.3
11 60
13 50
14 55
17 68];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); 
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DwyeTreb2016';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Preferred temperature 6 C; weight W (g) - total length L (cm): 0.00387*L^3.206';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4RQRM'; % Cat of Life
metaData.links.id_ITIS = '172930'; % ITIS
metaData.links.id_EoL = '46570122'; % Ency of Life
metaData.links.id_Wiki = 'Reinhardtius_hippoglossoides'; % Wikipedia
metaData.links.id_ADW = 'Reinhardtius_hippoglossoides'; % ADW
metaData.links.id_Taxo = '46967'; % Taxonomicon
metaData.links.id_WoRMS = '127144'; % WoRMS
metaData.links.id_fishbase = 'Reinhardtius-hippoglossoides'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Reinhardtius_hippoglossoides}}';
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
bibkey = 'DwyeTreb2016'; type = 'Article'; bib = [ ... 
'author = {K. S. Dwyer and M. A. Treble and S. E. Campana}, ' ... 
'year = {2016}, ' ...
'title = {Age and growth of {G}reenland Halibut (\emph{Reinhardtius hippoglossoides}) in the {N}orthwest {A}tlantic: {A} changing perception based on bombradiocarbon analyses}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {179}, ' ...
'pages = {342-350}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/516}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'access'; type = 'Misc'; bib = [...
'author = {D. M. Blood and J. T. Duffy-Anderson and A, C, Matarese}, ' ... 
'howpublished = {\url{https://access.afsc.noaa.gov/pubs/posters/pdfs/pBlood02_greenland-halibut.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

