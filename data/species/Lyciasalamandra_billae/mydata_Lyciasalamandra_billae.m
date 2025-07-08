function [data, auxData, metaData, txtData, weights] = mydata_Lyciasalamandra_billae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lyciasalamandra_billae'; 
metaData.species_en = 'Bay Lycian salamander'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTh', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 15]; 


%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SinsBock2017';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SinsBock2017';
data.Lp  = 5.79;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'SinsBock2017'; 
data.Li  = 8.0;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'SinsBock2017';

data.Wwb = 0.415; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = '';
  comment.Wwb = 'based on length-weight of Salamandra_lanzai: (2.5/9.1)^3*20';
data.Wwp = 5.15;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = '';
  comment.Wwp = 'based on length-weight of Salamandra_lanzai: (5.79/9.1)^3*20';
data.Wwi = 13.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = '';
  comment.Wwi = 'based on length-weight of Salamandra_lanzai: (8/9.1)^3*20';

data.Ri = 2/365;  units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';  bibkey.Ri = 'SinsBock2017';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-weight
data.tL = [... % time since birth (d), SVL (cm)
0.000	4.167
0.000	4.262
0.000	4.389
0.000	4.532
0.020	4.040
0.020	4.675
0.020	4.786
0.020	4.849
0.020	4.976
0.977	5.690
0.997	5.833
0.997	5.389
1.953	6.738
1.973	6.373
1.973	6.500
1.973	6.595
1.973	6.976
1.993	6.135
1.993	6.230
2.990	6.706
2.990	7.151
2.990	7.754
3.010	6.500
3.010	6.913
3.010	7.040
3.010	7.310
3.967	7.722
4.007	6.817
4.027	7.611
4.027	7.484
4.027	7.310
4.027	7.135
4.027	7.024
4.944	7.675
4.963	7.897
4.983	6.405
4.983	7.040
4.983	7.119
4.983	7.246
4.983	7.405
4.983	7.484
5.940	7.770
5.940	7.643
6.000	7.992
6.000	7.468
6.000	7.373
6.000	7.246
6.020	7.103
6.977	6.913
6.977	7.246
6.977	7.675
6.977	7.770
6.977	7.865
7.953	7.071
7.973	7.167
7.973	7.437
10.007	7.563
10.944	7.595];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365;
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SinsBock2017';

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
D1 = 'Males are assumed not to differ from females, as found by SinsBock2017, but amphibiaweb reports that males are somewhat smaller';   
D2 = 'Temperature ranges from 13 to 30 C';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'SinsBock2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '72PDP'; % Cat of Life
metaData.links.id_ITIS = '775925'; % ITIS
metaData.links.id_EoL = '4359456'; % Ency of Life
metaData.links.id_Wiki = 'Lyciasalamandra_billae'; % Wikipedia
metaData.links.id_ADW = 'Lyciasalamandra_billae'; % ADW
metaData.links.id_Taxo = '985988'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Lyciasalamandra+billae'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lyciasalamandra_billae}}';
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
bibkey = 'SinsBock2017'; type = 'Article'; bib = [ ... 
'author = {Ulrich Sinsch and Helen B\"{o}cking and Christoph Leskovar and Mehmet \"{O}z and Michael Veith}, ' ... 
'year = {2017}, ' ...
'title = {Demography and lifetime growth patterns in viviparous salamanders (genus \emph{Lyciasalamandra}): {L}iving underground attenuates interspecific variation}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {269}, ' ...
'pages = {48-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Lyciasalamandra+billae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

