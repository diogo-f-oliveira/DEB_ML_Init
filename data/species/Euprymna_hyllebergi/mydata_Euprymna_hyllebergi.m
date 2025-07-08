function [data, auxData, metaData, txtData, weights] = mydata_Euprymna_hyllebergi 

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiolida'; 
metaData.family     = 'Sepiolidae';
metaData.species    = 'Euprymna_hyllebergi'; 
metaData.species_en = 'Bobtail squid'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 

%% set data
% zero-variate data

data.ab = 14;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'NabhNila2005';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 66;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'NabhNila2005';
  temp.tp = C2K(28.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 98.9;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NabhNila2005';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.22; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'NabhNila2005';
data.Lp  = 1.75; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'NabhNila2005';
data.Li  = 2.24; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'NabhNila2005';

data.Wwb = 0.0041; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NabhNila2005';
data.Wwp = 3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'NabhNila2005';
data.Wwi = 5.88; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'NabhNila2005';

data.Ni  = 191.3; units.Ni  = '#'; label.Ni  = 'cum reprod at death';    bibkey.Ni  = 'NabhNila2005';   
  temp.Ni = C2K(28.2);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.083	0.223
9.689	0.303
20.249	0.474
29.920	0.732
39.949	0.960
50.012	1.279
60.102	1.676
69.922	1.837
80.058	1.855
89.692	2.011
100.271	2.233];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NabhNila2005';
 
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.192	0.070
10.172	0.060
20.340	0.070
30.346	0.272
40.002	0.628
50.276	1.502
60.583	2.646
70.260	3.176
80.328	3.877
90.593	4.675
100.538	5.877];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(28.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NabhNila2005';
  
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

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'NabhNila2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6HDTF'; % Cat of Life
metaData.links.id_ITIS = '557204'; % ITIS
metaData.links.id_EoL = '489601'; % Ency of Life
metaData.links.id_Wiki = 'Euprymna_hyllebergi'; % Wikipedia
metaData.links.id_ADW = 'Euprymna_hyllebergi'; % ADW
metaData.links.id_Taxo = '157825'; % Taxonomicon
metaData.links.id_WoRMS = '410361'; % WoRMS
metaData.links.id_molluscabase = '410361'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Euprymna_hyllebergi}}';
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
bibkey = 'NabhNila2005'; type = 'Article'; bib = [ ... 
'author = {Nabhitabhata, J. and Nilaphat, P. and Promboon, P. and Jaroongpattananon, C.}, ' ... 
'year = {2005}, ' ...
'title = {LIFE CYCLE OF CULTURED BOBTAIL SQUID, \emph{Euprymna hyllebergi} {N}ATEEWATHANA, 1997}, ' ...
'journal = {Phuket mar. biol. Cent. Res. Bull.}, ' ...
'volume = {66}, ' ...
'pages = {351-365}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

