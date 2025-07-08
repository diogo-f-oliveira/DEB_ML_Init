function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_dabryanus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_dabryanus'; 
metaData.species_en = 'Yangtze sturgeon'; 

metaData.ecoCode.climate = {'MC','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'MPNW','THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp 
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 04];

%% set data
% zero-variate data;
data.am = 67*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'guess';   
  temp.am = C2K(17);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 106;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 250;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'ZhuaKe1997';
  comment.Wwb = 'based on egg diameter of 2.7–3.4 mm: pi/6*0.31^3';
data.Wwp = 8.5e3;    units.Wwp = 'g';   label.Wwp = 'uwet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00324*Lp^3.17, see F1';
data.Wwi = 129e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00324*Li^3.17, see F1';
 
data.Ri  = 130e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth, (yr), total length (cm), weight (g)
    0  21.3 NaN
    1  44.1   80
    2  55.0  650
    3  68.2 1300
    4  77.5 4250
    5  86.5 6600
    6  95.5 8600
    7 101.0 11850
    8 106.0 14700];
data.tLW(:,1) = 365 * (0.75 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'};     label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(17);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ZhuaKe1997'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

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
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00324*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Dabry’s sturgeon is restricted to the Yangtze River system';
metaData.bibkey.F2 = 'ZhuaKe1997'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '9C54'; % Cat of Life
metaData.links.id_ITIS = '550551'; % ITIS
metaData.links.id_EoL = '46561182'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_dabryanus'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_dabryanus'; % ADW
metaData.links.id_Taxo = '42428'; % Taxonomicon
metaData.links.id_WoRMS = '410045'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-dabryanusm'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_dabryanus}}';  
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
bibkey = 'ZhuaKe1997'; type = 'Article'; bib = [ ...  
'doi = {10.1007/0-306-46854-9_15}, ' ...
'author = {Zhuang, P. and Ke, F. and Wei, Q. and He, X. and Cen, Y.}, ' ...
'year = {1997}, ' ...
'title = {Biology and life history of Dabry’s sturgeon, \emph{Acipenser dabryanus}, in the {Y}angtze {R}iver}, ' ... 
'journal = {Developments in Environmental Biology of Fishes}, ' ...
'volume = {48}, ' ...
'pages = {257–264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-dabryanus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

