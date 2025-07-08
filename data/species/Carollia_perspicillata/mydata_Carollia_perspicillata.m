function [data, auxData, metaData, txtData, weights] = mydata_Carollia_perspicillata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Phyllostomidae';
metaData.species    = 'Carollia_perspicillata'; 
metaData.species_en = 'Seba short-tailed bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHn', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 


%% set data
% zero-variate data

data.tg = 95;  units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 40;  units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Flem1988';   
  temp.tx = C2K(36.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Wiki 18-25 d';
data.tp = 258;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 4.2; units.Li  = 'cm';  label.Li  = 'ultimate forearm-length';  bibkey.Li  = 'Flem1988';

data.Wwb = 5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 12.5;units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 15;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length forearm (cm)
4.066	2.586
8.017	3.026
12.076	3.300
16.140	3.650
20.202	3.959
24.246	3.971
28.173	4.012
32.223	4.130
36.269	4.177
40.431	4.171
44.357	4.206
64.083	4.1848
71.223	4.1472
78.152	4.1571];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length forearm'};  
temp.tL   = C2K(36.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Flemm1988';
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.084	4.849
4.086	5.146
8.252	6.474
12.145	7.074
16.309	8.341
20.220	9.366
24.358	10.027
28.393	11.113
32.549	12.198
36.725	13.768
40.855	14.247
44.749	14.848
64.409	15.976
71.254	16.744
78.239	16.542
85.873	16.520];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(36.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Flemm1988';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '69DLM'; % Cat of Life
metaData.links.id_ITIS = '631822'; % ITIS
metaData.links.id_EoL = '327438'; % Ency of Life
metaData.links.id_Wiki = 'Carollia_perspicillata'; % Wikipedia
metaData.links.id_ADW = 'Carollia_perspicillata'; % ADW
metaData.links.id_Taxo = '64417'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801300'; % MSW3
metaData.links.id_AnAge = 'Carollia_perspicillata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carollia_perspicillata}}';
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
bibkey = 'Flemm1988'; type = 'Book'; bib = [ ... 
'author = {Flemming, T. H.}, ' ... 
'year = {1988}, ' ...
'title = {The short-tailed fruitbat; a study in plant-animal interactions}, ' ...
'publisher = {Univ Chicago Press}, ' ...
'address = {Chicago}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Carollia_perspicillata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

