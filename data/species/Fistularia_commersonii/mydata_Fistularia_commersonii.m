function [data, auxData, metaData, txtData, weights] = mydata_Fistularia_commersonii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Fistulariidae';
metaData.species    = 'Fistularia_commersonii'; 
metaData.species_en = 'Bluespotted cornetfish'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MPSW','MI','MAm'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data

data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(17.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'survived 3.5 yr in lab';

data.Lp  = 65;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 160;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SaadSabo2010';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 354;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00129*Lp^3.00, see F1';
data.Wwi = 5.3e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00129*Li^3.00, see F1';

data.GSI = 0.05; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'SaadSabo2010';
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
2 75.77
3 82.62
4 94.35];
data.tL(:,1) = (data.tL(:,1)+0)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastFala2014';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
69.209	220.400
70.664	222.144
71.912	234.757
72.120	247.418
72.275	238.361
72.483	227.492
72.745	272.729
73.156	205.742
73.732	265.444
73.785	278.112
74.196	216.555
74.405	232.835
74.407	259.984
74.717	234.631
74.822	256.345
74.824	279.875
74.872	231.004
75.189	301.577
75.395	279.849
75.548	236.403
75.859	227.339
75.914	268.965
76.066	218.280
76.070	272.578
76.276	241.800
76.278	277.999
76.484	254.460
76.642	285.222
77.162	285.199
77.734	299.652
77.939	263.444
78.253	296.009
78.512	288.757
78.881	357.519
78.985	371.994
79.293	305.012
79.297	368.360
79.396	295.957
79.554	332.149
79.971	352.040
80.074	330.316
80.127	350.223
80.177	317.641
80.383	297.723
80.538	285.046
80.645	326.670
81.165	344.746
83.193	369.994
83.714	393.499
83.768	420.646
84.238	458.634
84.283	359.085
84.751	360.873
84.805	389.830
86.365	420.529
87.144	409.634
92.398	523.423
96.771	673.452];
units.LW   = {'cm', 'g'};  label.LW = {'total length without filaments', 'weight'};  
bibkey.LW = 'CastFala2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00129*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6J77G'; % Cat of Life
metaData.links.id_ITIS = '644918'; % ITIS
metaData.links.id_EoL = '46567831'; % Ency of Life
metaData.links.id_Wiki = 'Fistularia_commersonii'; % Wikipedia
metaData.links.id_ADW = 'Fistularia_commersonii'; % ADW
metaData.links.id_Taxo = '105710'; % Taxonomicon
metaData.links.id_WoRMS = '217966'; % WoRMS
metaData.links.id_fishbase = 'Fistularia-commersonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fistularia_commersonii}}';
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
bibkey = 'CastFala2014'; type = 'Article'; bib = [ ... 
'author = {Luca Castriota and Manuela Falautano and Pietro Battaglia and Alberto Oddo and Franco Andaloro}, ' ... 
'year = {2014}, ' ...
'title = {New biological data on \emph{Fistularia commersonii} in the central {M}editerranean {S}ea}, ' ...
'journal = {Cybium}, ' ...
'volume = {38(1)}, ' ...
'pages = {15-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaadSabo2010'; type = 'Article'; bib = [ ... 
'author = {Adib Ali Saad and Waad Georges Sabour}, ' ... 
'year = {2010}, ' ...
'title = {IMPACT OF INVASIVE SPECIES ON THE BIODIVERSITY AND FISH STOCK; CASE STUDY: \emph{Fistularia commersonii} {R}UPPEL, IN THE {S}YRIAN COAST}, ' ...
'journal = {Rapp. Comm. int. Mer M\''{e}dit.}, ' ...
'volume = {39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Fistularia-commersonii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

