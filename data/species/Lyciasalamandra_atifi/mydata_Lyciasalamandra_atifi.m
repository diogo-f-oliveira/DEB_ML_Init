function [data, auxData, metaData, txtData, weights] = mydata_Lyciasalamandra_atifi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lyciasalamandra_atifi'; 
metaData.species_en = 'Atif''s Lycian salamander'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTh', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
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

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SinsBock2017';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SinsBock2017';
data.Lp  = 7.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'SinsBock2017'; 
data.Li  = 9.2;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'SinsBock2017';

data.Wwb = 1.24; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on length-weight of Salamandra_lanzai: (3.6/9.1)^3*20';
data.Wwp = 12.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on length-weight of Salamandra_lanzai: (7.8/9.1)^3*20';
data.Wwi = 20.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Salamandra_lanzai: (9.2/9.1)^3*20';

data.Ri = 2/365;  units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';  bibkey.Ri = 'SinsBock2017';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-weight
data.tL = [... % time since birth (d), SVL (cm)
0.032	4.991
0.032	5.134
0.014	4.293
0.004	3.626
0.007	4.864
0.009	5.324
0.009	5.467
0.010	5.610
0.010	5.705
0.010	5.832
0.010	5.943
0.027	4.594
0.027	4.721
0.031	6.134
0.989	6.004
0.990	6.227
0.990	6.481
0.991	6.576
0.991	6.671
0.991	6.830
0.992	6.893
0.992	7.052
1.992	7.795
2.030	7.113
2.031	7.287
2.033	7.906
3.033	8.666
3.070	7.729
3.072	8.285
3.072	8.348
3.072	8.443
3.951	8.536
3.970	8.028
3.990	8.123
4.010	8.266
4.031	8.647
4.032	8.726
4.992	9.406
5.009	8.232
5.011	9.168
5.029	8.406
5.030	8.549
5.030	8.660
5.050	8.819
5.071	8.930
5.948	8.594
5.949	8.785
5.949	8.928
5.988	8.451
6.009	9.039
7.025	8.195
7.046	8.512
7.046	8.655
7.048	9.274
8.005	8.811
8.026	8.906
8.026	9.033
9.044	8.904
10.023	9.314];
data.tL(:,1) = (.5 + data.tL(:,1)) * 365;
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
D2 = 'Temperature ranges from 12 to 27 C';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'SinsBock2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QPDP'; % Cat of Life
metaData.links.id_ITIS = '775924'; % ITIS
metaData.links.id_EoL = '4359457'; % Ency of Life
metaData.links.id_Wiki = 'Lyciasalamandra_atifi'; % Wikipedia
metaData.links.id_ADW = 'Lyciasalamandra_atifi'; % ADW
metaData.links.id_Taxo = '985987'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Lyciasalamandra+atifi'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lyciasalamandra_atifi}}';
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
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Lyciasalamandra+atifi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

