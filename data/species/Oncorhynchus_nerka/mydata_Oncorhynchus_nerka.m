function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_nerka

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_nerka'; 
metaData.species_en = 'Sockeye salmon'; 

metaData.ecoCode.climate = {'MC','BSk','BWk'};
metaData.ecoCode.ecozone = {'MPN','TH'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(8); 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 16]; 


%% set data
% zero-variate data
  
  data.ab = 90;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'usgs';  
    temp.ab = C2K(4.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'fishbase';           
    temp.tp = C2K(8);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  data.am = 8*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'fishbase';           
    temp.am = C2K(8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lp  = 60;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  data.Li  = 84;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
    comment.Li = 'Wiki gives 55 cm';
  
  data.Wwb = 0.092;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'usgs';  
    comment.Wwb = 'based on egg diameter of 5.6 mm of O. mykiss: pi/6*0.56^3';
  data.Wwp = 2.8e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
    comment.Wwp = 'based on Wwi*(Lp/Li)^3';
  data.Wwi = 7.7e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';

  data.NR  = 4300;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
    temp.NR = C2K(8); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% Uni-variated data
% time-weight
data.tWw = [ % ... % time (d), wet weight (g)
0	    1.326
28.067	3.609
42.534	5.169
56.501	7.307
69.939	8.881
83.396	11.756
98.095	15.662
112.016	18.060
125.452	21.807
139.624	25.310
153.541	28.616
167.463	32.997
181.882	38.297
195.073	46.855
209.002	55.833];
units.tWw   = {'d', 'g'};  label.tWw = {'time','wet weight'};  
temp.tWw    = C2K(15);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'BretShel1975';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females (deviating morphology develops during migration upstream river)';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'dies soon after spawning';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'land-locked populations are known as kokanee';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '49JFH'; % Cat of Life
metaData.links.id_ITIS = '161979'; % ITIS
metaData.links.id_EoL = '46563140'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_nerka'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_nerka'; % ADW
metaData.links.id_Taxo = '42809'; % Taxonomicon
metaData.links.id_WoRMS = '254569'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-nerka'; % fishbase


%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_nerka}}';
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
bibkey = 'BretShel1975'; type = 'Article'; bib = [ ... 
'doi = 10.1139/f75-248}, ' ...
'author = {J. R. Brett and J. E. Shelbourn}, ' ... 
'year = {1975}, ' ...
'title = {Growth Rate of Young Sockeye Salmon, \emph{Oncorhynchus nerka}, in Relation to Fish Size and Ration Level}, ' ...
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {32(11)}, ' ...
'pages = {2103-2110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-nerka.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'usgs'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.usgs.gov/faqs/why-do-salmon-eggs-come-different-colors?qt-news_science_products=0#qt-news_science_products}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
