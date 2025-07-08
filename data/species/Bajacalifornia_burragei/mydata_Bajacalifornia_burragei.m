function [data, auxData, metaData, txtData, weights] = mydata_Bajacalifornia_burragei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Alepocephaliformes'; 
metaData.family     = 'Alepocephalidae';
metaData.species    = 'Bajacalifornia_burragei'; 
metaData.species_en = 'Sharpchin slickhead'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW', 'MPW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mpb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 23]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ChilTayl1980';  
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'ChilTayl1980';
data.Li = 18.1;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.24e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ChilTayl1980';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 28.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','ChilTayl1980'};  
  comment.Wwp = 'based on 0.00339*Lp^3.19, see F3';
data.Wwi = 34.8;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00339*Li^3.19, see F3';

data.Ri = 6e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(6.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (yr), standard length (cm) 
0.472	7.946
0.948	9.349
1.457	10.472
1.949	12.966
2.474	13.965
2.982	15.493
3.459	17.084
3.983	19.765];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChilTayl1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 3 * weights.Ri;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Deep water, so temperature of 4 C assumed';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.00339*(SL in cm)^3.19';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '68CMJ'; % Cat of Life
metaData.links.id_ITIS = '162350'; % ITIS
metaData.links.id_EoL = '46562798'; % Ency of Life
metaData.links.id_Wiki = 'Bajacalifornia'; % Wikipedia
metaData.links.id_ADW = 'Bajacalifornia_burragei'; % ADW
metaData.links.id_Taxo = '162837'; % Taxonomicon
metaData.links.id_WoRMS = '272857'; % WoRMS
metaData.links.id_fishbase = 'Bajacalifornia-burragei'; % fishbase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChilTayl1980'; type = 'article'; bib = [ ...
'author = {J. J. Childress and S. M. Taylor and G. M. Cailliet and M. H. Price}, ' ... 
'year   = {1980}, ' ...
'title  = {Patterns of Growth, Energy Utilization and Reproduction in Some Meso- and Bathypelagic Fishes off {S}outhern {C}alifornia}, ' ...
'journal = {Marine Biology}, ' ...
'page = {27-40}, ' ...
'volume = {61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bajacalifornia-burragei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

