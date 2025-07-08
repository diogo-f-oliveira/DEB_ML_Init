  function [data, auxData, metaData, txtData, weights] = mydata_Dorosoma_petenense

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Dorosoma_petenense'; 
metaData.species_en = 'Threadfin shad'; 

metaData.ecoCode.climate = {'Cfa','MB'};
metaData.ecoCode.ecozone = {'THn','MAg'};
metaData.ecoCode.habitat = {'piMpe', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 01]; 

%% set data
% zero-variate data
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'John1970';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4.8;     units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'John1971';
  comment.Lp = 'Read from LN data';
data.Li = 19.5;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'John1970';
  comment.Li = 'This is for saltwater specimens; freshwater one remain smaller';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'John1971';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 115;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'John1970','fishbase'};
  comment.Wwi = 'based on 0.00912*(Li/0.82)^2.98, see F2,F3';
  
% uni-variate data
% time - length
data.tL_R = [ ... % time since birth (yr), standard length (cm) 
1 3.90
2 6.32
3 7.87
4 9.27];
data.tL_R(:,1) = 365 * (0.5 + data.tL_R(:,1));
units.tL_R = {'d', 'cm'};     label.tL_R = {'time since birth', 'standard length', 'Roosevelt Lake, Arizona'};  bibkey.tL_R = 'John1970';
temp.tL_R = C2K(20);  units.temp.tL_R = 'K'; label.temp.tL_R = 'temperature';
comment.tL_R = 'Data for Roosevelt Lake, Arizona';
%
data.tL_A = [ ... % time since birth (yr), total length (cm) 
1 3.58
2 5.70
3 7.08
4 8.24];
data.tL_A(:,1) = 365 * (0.5 + data.tL_A(:,1));
units.tL_A = {'d', 'cm'};     label.tL_A = {'time since birth', 'standard length', 'Apache Lake, Arizona'};  bibkey.tL_A = 'John1970';
temp.tL_A = C2K(20);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
comment.tL_A = 'Data for Apache Lake, Arizona';

data.LN = [ ... % standard length (cm), mature ovaries (#)
4.875	1052.448
4.876	1135.536
4.938	1426.344
4.963	927.816
5.086	1343.256
5.233	1260.168
5.355	1564.824
5.503	1592.520
5.770	1592.520
5.774	2007.960
5.803	1938.720
5.892	1924.872
5.984	2340.312
6.196	2783.448
6.249	2049.504
6.252	2395.704
6.430	2354.160
6.430	2451.096
6.518	2229.528
6.848	2714.208
6.976	3752.808
7.010	4334.424
7.244	3905.136
7.331	3655.872
7.480	3683.568
7.518	4708.320
7.566	3351.216
7.599	3725.112
7.664	4486.752
7.702	5414.568
7.777	3725.112
7.782	4403.664
7.872	4514.448
7.964	4791.408
8.090	5636.136
8.145	5165.304
8.227	4375.968
8.232	4888.344
8.329	5830.008
8.359	5913.096
8.376	4389.816
8.387	5733.072
8.441	5096.064
8.497	4639.080
8.534	5497.656
8.623	5553.048
8.630	6300.840
8.803	5788.464
8.897	6370.080
8.960	6799.368
9.047	6508.560
9.102	6010.032
9.258	6937.848
9.316	6743.976
9.500	7477.920
9.688	8571.912];
units.LN = {'cm', '#'};     label.LN = {'time since birth', 'total length'};  bibkey.LN = 'John1971';
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';


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

%% Group plots
set1 = {'tL_R','tL_A'}; subtitle1 = {'Data for Roosevelt, Apache Lake (Arizona)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males ase assumed not to differ from females';
metaData.bibkey.D1 = 'John1970'; 
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Saltwater specimens can grow considarably larger. SL 17.9 in Tampa Bay, Florida, 19.5 cm in Salton Sea, California';
metaData.bibkey.F1 = 'John1970'; 
F2 = 'length-weight: Ww in g = 0.00912*(TL in cm)^2.98';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6DGCX'; % Cat of Life
metaData.links.id_ITIS = '161738'; % ITIS
metaData.links.id_EoL = '46562460'; % Ency of Life
metaData.links.id_Wiki = 'Dorosoma_petenense'; % Wikipedia
metaData.links.id_ADW = 'Dorosoma_petenense'; % ADW
metaData.links.id_Taxo = '173387'; % Taxonomicon
metaData.links.id_WoRMS = '276310'; % WoRMS
metaData.links.id_fishbase = 'Dorosoma-petenense'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Dorosoma_petenense}}';  
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
'howpublished = {\url{www.fishbase.org/summary/Dorosoma-petenense.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John1970'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1970)99<739:AGAPDO>2.0.CO;2}, ' ...
'author = {James E. Johnson}, ' ...
'year = {1970}, ' ...
'title  = {Age, Growth, and Population Dynamics of Threadfin Shad, \emph{Dorosoma petenense} (G\"{u}nther), in {C}entral {A}rizona {R}eservoirs}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {99}, ' ...
'pages = {739-753}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'John1971'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1971)100<74:MAFOTS>2.0.CO;2}, ' ...
'author = {James E. Johnson}, ' ...
'year = {1971}, ' ...
'title  = {Maturity and Fecundity of Threadfin Shad, \emph{Dorosoma petenense} (G\"{u}nther), in {C}entral {A}rizona {R}eservoirs}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {100}, ' ...
'pages = {74-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  