function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_baerii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_baerii'; 
metaData.species_en = 'Siberian sturgeon'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 04];

%% set data
% zero-variate data;
data.ab = 36; units.ab = 'd';  label.ab = 'age at birth';      bibkey.ab = 'fishbase';   
  temp.ab = C2K(18);units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch 16 d at 10-15 C, feeding 20 dph at 18 C';
data.tp = 10.5*365; units.tp = 'd';  label.tp = 'time since birth at puberty';      bibkey.tp = 'WillNonn2018';   
  temp.tp = C2K(15);units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '9-12 yr for Ob-Irtysh basin';
data.am = 63*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'WillNonn2018';   
  temp.am = C2K(15);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 106.5;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WillNonn2018';
  comment.Lp = 'WillNonn2018 for Ob-Irtysh basin: 103-110 cm';
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.37 to 2.92 mm: pi/6*0.26^3';
data.Wwp = 9e3;    units.Wwp = 'g';   label.Wwp = 'uwet weight at puberty';   bibkey.Wwp = 'WillNonn2018';
  comment.Wwp = 'for Ob-Irtysh basin';
data.Wwi = 85.3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weigpi/6*0.26^3ht';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.26, see F1; max published weight 210 kg';
 
data.Ri  = 1.46e6/365/4; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'WillNonn2018';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'WillNonn2018: spawning year 4 yrs';
  
% uni-variate data

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = weights.Wwi*0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
 
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00269*(TL in cm)^3.26';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9C4T'; % Cat of Life
metaData.links.id_ITIS = '161066'; % ITIS
metaData.links.id_EoL = '51263572'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_baerii'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_baerii'; % ADW
metaData.links.id_Taxo = '107311'; % Taxonomicon
metaData.links.id_WoRMS = '233942'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-baerii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_baerii}}';  
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
bibkey = 'WillNonn2018'; type = 'book'; bib = [ ...  
'doi = {10.1007/978-3-319-61664-3}, ' ...
'author = {Patrick Williot and Guy Nonnotte and Denise Vizziano-Cantonnet and Mikhail Chebanov}, ' ...
'year = {2018}, ' ...
'title = {The Siberian Sturgeon (\emph{Acipenser baerii}, {B}randt, 1869); Volume 1 - Biology}, ' ... 
'publisher = {Springer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-baerii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

