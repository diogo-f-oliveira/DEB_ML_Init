function [data, auxData, metaData, txtData, weights] = mydata_Rhinoceros_unicornis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Rhinocerotidae';
metaData.species    = 'Rhinoceros_unicornis'; 
metaData.species_en = 'Indian rhinoceros'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 479;    units.tg = 'd';    label.tg = 'gestation time';   bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 456;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1678;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 43.5*365; units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 325;   units.Li  = 'cm';  label.Li  = 'ultimate body-length for female'; bibkey.Li  = 'Wiki';
  comment.Li = '310-340 cm';
data.Lim  = 325;  units.Lim  = 'cm';  label.Lim  = 'ultimate body-length for male'; bibkey.Lim  = 'Wiki';
  comment.Lim = '368-380 cm';

data.Wwb = 58e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 885812; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 1602330; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 1/850; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.979	76.281
8.811	99.051
15.175	113.852
26.923	142.315
39.650	171.917
53.846	195.825
67.063	223.150
77.832	242.505
85.664	262.998
96.923	281.214
112.587	308.539
126.783	334.725
137.552	358.634
150.280	385.958
164.476	411.006
180.140	446.300
200.699	480.455
220.280	513.472
236.434	539.658
252.098	564.706
266.294	587.476
280.490	611.385
302.517	647.818];
data.tW(:,2) = 1e3 * data.tW(:,2); % convert kg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZschBaur2002';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4S853'; % Cat of Life
metaData.links.id_ITIS = '625005'; % ITIS
metaData.links.id_EoL = '129475'; % Ency of Life
metaData.links.id_Wiki = 'Rhinoceros_unicornis'; % Wikipedia
metaData.links.id_ADW = 'Rhinoceros_unicornis'; % ADW
metaData.links.id_Taxo = '69154'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100071'; % MSW3
metaData.links.id_AnAge = 'Rhinoceros_unicornis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinoceros_unicornis}}';
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
bibkey = 'ZschBaur2002'; type = 'Article'; bib = [ ... 
'author = {S. Zschokke and B. Baur}, ' ... 
'year = {2002}, ' ...
'title = {Inbreeding, outbreeding, infant growth, and size dimorphism in captive {I}ndian rhinoceros (\emph{Rhinoceros unicornis})}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {80}, ' ...
'pages = {2014-2023}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhinoceros_unicornis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

