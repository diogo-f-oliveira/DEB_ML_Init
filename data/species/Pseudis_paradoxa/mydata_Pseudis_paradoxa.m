function [data, auxData, metaData, txtData, weights] = mydata_Pseudis_paradoxa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Pseudis_paradoxa'; 
metaData.species_en = 'Paradoxical frog'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', '0jFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 14]; 

%% set data
% zero-variate data

data.am = 11*365; units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnAge';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 4.79;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam for females';         bibkey.Lj  = 'DownRamn2009';
data.Ljm = 4.49;  units.Ljm  = 'cm';  label.Ljm  = 'SVL at metam for males';         bibkey.Ljm  = 'DownRamn2009';
data.Lp  = 4.80;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';       bibkey.Lp  = 'guess';
data.Lpm = 4.50;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';      bibkey.Lpm  = 'guess';
data.Li  = 5.68;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'DownRamn2009';
data.Lim = 5.09;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'DownRamn2009';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'guess';
  comment.Wwb = 'bas on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwj  = 27.2; units.Wwj = 'g';  label.Wwj = 'wet weight at metam for females';  bibkey.Wwj = 'DownRamn2009';
data.Wwjm = 17.8; units.Wwjm = 'g';  label.Wwjm = 'wet weight at metam for males';  bibkey.Wwjm = 'DownRamn2009';
data.Wwp  = 27.5; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'guess';
data.Wwpm = 18;   units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'guess';
data.Wwi  = 29.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'DownRamn2009';
data.Wwim = 21.2; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'DownRamn2009';

data.Ri  = 1e4/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
0	0.548
7	2.922
14	6.119];
units.tW  = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW   = C2K(26);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'DownRamn2009';
%
data.tW1 = [ ... % time (d), weight (g)
0	2.420
7	7.671
14	14.429];
units.tW1  = {'d', 'g'};  label.tW1 = {'time', 'weight'};  
temp.tW1   = C2K(26);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'DownRamn2009';

data.LW_j = [ ... % log10 wet weight (g), log10 SVL (mm),  of tadpoles
-0.599	1.032
-0.551	1.016
-0.507	1.011
-0.476	1.048
-0.438	1.074
-0.376	1.072
-0.342	1.124
-0.315	1.106
-0.225	1.138
-0.109	1.172
-0.068	1.180
0.083	1.201
0.189	1.251
0.206	1.265
0.275	1.270
0.398	1.318
0.439	1.296
0.539	1.384
0.570	1.352
0.638	1.381
0.703	1.389
0.727	1.413
1.265	1.611
1.272	1.630
1.293	1.645
1.423	1.704
1.457	1.677
1.553	1.572
1.577	1.722
1.618	1.669
1.618	1.698
1.646	1.751
1.701	1.751
1.745	1.728
1.793	1.820
1.821	1.812
1.834	1.804];
data.LW_j = 10.^(data.LW_j(:,[2 1])); % remove log10 transformation
data.LW_j(:,1) = data.LW_j(:,1)/ 10; % convert mm to cm
units.LW_j  = {'cm', 'g'};  label.LW_j = {'SVL', 'wet weight', 'tadpoles'};  
bibkey.LW_j = 'DownRamn2009';
comment.LW_j = 'data for tadpoles';
%
data.LW_f = [ ...  % log10 wet weight (g), log10 SVL (mm),  of post-metamoph females
1.187	1.640
1.481	1.722
1.564	1.691];
data.LW_f = 10.^(data.LW_f(:, [2 1])); % remove log10 transformation
data.LW_f(:,1) = data.LW_f(:,1)/ 10; % convert mm to cm
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'wet weight', 'post-metamorph females'};  
bibkey.LW_f = 'DownRamn2009';
comment.LW_f = 'data for post-metamorph females';
%
data.LW_m = [ ...  % log10 wet weight (g), log10 SVL (mm),  of post-metamoph males
1.135	1.656
1.139	1.624
1.190	1.611
1.190	1.680
1.200	1.645
1.259	1.666
1.382	1.709
1.509	1.632];
data.LW_m = 10.^(data.LW_m(:,[2 1])); % remove log10 transformation
data.LW_m(:,1) = data.LW_m(:,1)/ 10; % convert mm to cm
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'wet weight', 'post-metamorph males'};  
bibkey.LW_m = 'DownRamn2009';
comment.LW_m = 'data for post-metamorph males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.tW1 = 3 * weights.tW1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_j','LW_m'}; subtitle1 = {'Data for post-metam females, tadpoles, post-metam males'};
set2 = {'tW','tW1'}; subtitle2 = {'Data for different initial weights'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hj and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4NNNV'; % Cat of Life
metaData.links.id_ITIS = '662731'; % ITIS
metaData.links.id_EoL = '1039263'; % Ency of Life
metaData.links.id_Wiki = 'Pseudis_paradoxa'; % Wikipedia
metaData.links.id_ADW = 'Pseudis_paradoxa'; % ADW
metaData.links.id_Taxo = '93041'; % Taxonomicon
metaData.links.id_WoRMS = '1481791'; % WoRMS
metaData.links.id_amphweb = 'Pseudis+paradoxa'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pseudis_paradoxa'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudis_paradoxa}}';
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
bibkey = 'DownRamn2009'; type = 'Article'; bib = [ ... 
'author = {J.R. Downie and Ramnarine and K. Sams and P.T. Walsh}, ' ... 
'year = {2009}, ' ...
'title = {The paradoxical frog \emph{Pseudis paradoxa}; larval habitat, growth and metamorphosis}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {19}, ' ...
'pages = {11-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Pseudis_paradoxa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pseudis_paradoxa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

