function [data, auxData, metaData, txtData, weights] = mydata_Patinopecten_caurinus

%% set metaData
metaData.phylum     = 'Mollusca';
metaData.class      = 'Bivalvia';
metaData.order      = 'Pectinida';
metaData.family     = 'Pectinidae';
metaData.species    = 'Patinopecten_caurinus';
metaData.species_en = 'Giant Pacific scallop';

metaData.ecoCode.climate = {'ME','MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(9);

metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'GSI'};
metaData.data_1     = {'t-L_f'; 't-Ww_f'};

metaData.COMPLETE = 2.4;

metaData.author      = {'Bas Kooijman'};
metaData.date_subm   = [2021 02 24]; 
metaData.email       = {'bas.kooijman@vu.nl'}; 
metaData.address     = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 24]; 

%% Set zero-variate data;
data.tp   = 365 * 3; units.tp      = 'd'; label.tp      = 'time since birth at puberty';    bibkey.tp = 'guess';
  temp.tp = C2K(9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am   = 365 * 21; units.am      = 'd'; label.am      = 'life span';            bibkey.am = 'MacDBour1987';
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj = 0.06;  units.Lj = 'cm'; label.Lj = 'shell length at metamorphosis'; bibkey.Lj = 'guess';
data.Li = 17;     units.Li = 'cm'; label.Li = 'ultimate shell length';         bibkey.Li = 'MacDBour1987';

data.Wwb = 4.2e-6; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/6*0.02^3';

data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(9);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'GSI = 0.33 for E. arcuatus';

%% Set uni-variate data
%time-length data
data.tL1 = [ ... % time since birth (yr), shell height (cm)
1.006	3.432
2.139	5.898
3.028	9.788
4.002	11.288
4.980	13.372
5.898	13.828
6.966	14.157
7.985	14.639
9.001	14.637
9.866	14.840
10.934	15.118
11.953	15.549
12.919	15.649
13.987	15.952
15.003	15.976
16.021	16.229
16.934	16.126
18.051	15.971
18.969	16.606]; 
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since settlement', 'shell height', 'inshore'};
temp.tL1 = C2K(12); units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
comment.tL1 = 'Inshore data'; 
bibkey.tL1 = 'MacDBour1987';
%
data.tL2 = [ ... % time since birth (yr), shell height (cm)
0.956	3.458
2.039	6.153
3.119	8.237
3.992	9.711
4.960	10.091
5.926	10.343
6.996	10.800
8.064	11.052]; 
data.tL2(:,1) = 365 * data.tL2(:,1); % convert yr to d
units.tL2 = {'d', 'cm'}; label.tL2 = {'time since settlement', 'shell height', 'offshore'};
temp.tL2 = C2K(9); units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
comment.tL2 = 'Offshore data'; 
bibkey.tL2 = 'MacDBour1987';

% time-shell-free wet weight
data.tW1 = [ ... times since settlement (yr), somatic wet weight (g)
3.033	31.109
3.956	51.138
4.979	70.400
5.996	80.260
6.917	97.748
7.933	106.593
8.897	113.915
9.914	124.284
10.925	126.777
11.936	128.761
12.997	130.489
13.904	128.159
15.021	136.999
15.829	137.723
16.938	135.637
17.948	136.860
19.008	136.301];    
data.tW1(:,1) = 365 * data.tW1(:,1); % convert yr to d
units.tW1 = {'d', 'g'}; label.tW1 = {'time since settlement', 'shell-free wet weight', 'inshore'};
temp.tW1 = C2K(12); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
comment.tW1 = 'Inshore data'; 
bibkey.tW1 = 'MacDBour1987';
%
data.tW2 = [ ... % times since settlement (yr), somatic wet weight (g)
0.891	0.467
2.005	6.512
3.072	15.862
3.886	24.971
5.049	27.964
5.961	31.732
6.925	39.817
7.934	37.990]; 
data.tW2(:,1) = 365 * data.tW2(:,1); % convert yr to d
units.tW2 = {'d', 'g'}; label.tW2 = {'time since settlement', 'shell-free wet weight', 'offshore'};
temp.tW2 = C2K(9); units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
comment.tW2 = 'Growth in bed Uruguay at 108 m; temp from 7.5 to 8.8 C seasonally; length-weight conversion based on F1'; 
bibkey.tW2 = 'MacDBour1987';

%% Set weights for all real data
weights = setweights(data, []);
weights.tL1 = 5 * weights.tL1;
weights.tL2 = 5 * weights.tL2;
%weights.tp = 0 * weights.tp;

%% Set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Pack auxData and txtData for output
auxData.temp    = temp;
txtData.units   = units;
txtData.label   = label;
txtData.bibkey  = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data from inshore, offshore'};
set2 = {'tW1','tW2'}; subtitle2 = {'Data from inshore, offshore'};
metaData.grp.sets    = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Links
metaData.links.id_CoL = '75TLT'; % Cat of Life
metaData.links.id_ITIS = '79757'; % ITIS
metaData.links.id_EoL = '46467822'; % Ency of Life
metaData.links.id_Wiki = 'Patinopecten_caurinus'; % Wikipedia
metaData.links.id_ADW = 'Patinopecten_caurinus'; % ADW
metaData.links.id_Taxo = '512575'; % Taxonomicon
metaData.links.id_WoRMS = '393720'; % WoRMS
metaData.links.id_molluscabase = '393720'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pectinidae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBour1987'; type = 'Article'; bib = [ ...
'author = {B. A. MacDonald and N. F. Bourne}, ' ...
'year = {1987}, ' ...
'title = {Growth, Reproductive Output, and Energy Partitioning in Weathervane Scallops, \emph{Patinopecten caurinus}, from {B}ritish {C}olumbia}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {44}, ' ...
'pages = {152-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
