function [data, auxData, metaData, txtData, weights] = mydata_Hypsopsetta_guttulata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Hypsopsetta_guttulata'; 
metaData.species_en = 'Diamond turbot'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 17]; 

%% set data
% zero-variate data

data.tp = 2.5*365;    units.tp = 'd';  label.tp = 'time since birth at puberty for females'; bibkey.tp = 'fishbase';   
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'all temps are guessed';
data.am = 9*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 46;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'oac';
  comment.Wwb = 'based on egg diameter 1.5 mm: pi/6*0.15^3';
data.Wwi = 2.78e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'oac','fishbase'};
  comment.Wwi = 'based on tLW-data: (46/18.8)^3*190';
  
data.Ri  = 9e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.5';
 
% uni-variate data
% t-L/W data 
tLW = [... % time since birth (mnth), standard length (cm), wet weight (g)
 2  2.500    0.41
 4  6.564    7.42
 5  8.521   17.08
 6  8.659   18.01
 7  9.992   27.86
 8 10.023   30.11
 9 11.370   41.34
10 12.357   53.16
11 13.367   67.53
12 13.793   74.34
13 14.197   81.11
14 14.542   87.29
15 15.503  106.05
16 15.469  105.27
17 15.758  111.47
18 16.245  122.23
19 16.639  131.54
20 17.455  152.18
21 17.958  165.90
24 18.783  190.12];
tLW(:,1) = 30.5 * tLW(:,1);
data.tL = tLW(:,[1 2]);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'oac';
comment.tL = 'Data from Anaheim Bay';
%
data.tW = tLW(:,[1 3]);
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(4); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'oac';
comment.tW = 'Data from Anaheim Bay';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '3P4M5'; % Cat of Life
metaData.links.id_ITIS = '172945'; % ITIS
metaData.links.id_EoL = '46570153'; % Ency of Life
metaData.links.id_Wiki = 'Hypsopsetta_guttulata'; % Wikipedia
metaData.links.id_ADW = 'Hypsopsetta_guttulata'; % ADW
metaData.links.id_Taxo = '421966'; % Taxonomicon
metaData.links.id_WoRMS = '281128'; % WoRMS
metaData.links.id_fishbase = 'Hypsopsetta-guttulata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hypsopsetta_guttulata}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/4241}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'oac'; type = 'Misc'; bib = [...
'author = {E. D. Lane and C. W. Hill}, ' ... 
'year = {1975}, ' ...
'howpublished = {\url{http://www.oac.cdlib.org/view?docId=kt6n39n885&brand=oac4&doc.view=entire_text}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

