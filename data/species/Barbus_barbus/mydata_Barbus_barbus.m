  function [data, auxData, metaData, txtData, weights] = mydata_Barbus_barbus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Barbus_barbus'; 
metaData.species_en = 'Common barbel'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2017 08 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.ab = 18;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'Weim2007'; 
  temp.ab = C2K(17); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch at 4 d';
data.tp = 4*365;      units.tp = 'd';  label.tp = 'age at puberty for females';         bibkey.tp = 'Weim2007';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';         bibkey.tpm = 'Weim2007';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'Weim2007';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Weim2007'; 
data.Lpm = 15;    units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Weim2007'; 
data.Li = 70;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'Weim2007';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Weim2007';
  comment.Wwb = 'Computed from egg diameter of 1.25 mm: 4/3*pi*0.062^3';
data.Wwp = 127;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Weim2007';
  comment.Wwp = 'Between 119 and 135 g';
data.Wwpm = 57.5; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'Weim2007';
  comment.Wwpm = 'Between 47 and 68 g';
data.Wwi = 3e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Weim2007';
    
% univariate data
% time-length
% females
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.934	13.991
3.984	17.715
4.925	22.374
5.863	25.726
6.877	30.011
7.778	33.269
8.868	38.300
9.916	41.183
10.885	42.010
11.822	45.362
12.789	45.442
13.763	48.512
14.806	49.245
15.738	50.447
16.788	53.890
17.805	59.203
18.839	56.478
19.871	52.819];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Weim2007';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.980	5.327
1.993	9.331
2.932	12.963
4.019	16.780
4.919	19.851
5.889	21.333
6.934	22.907
7.907	25.323
8.843	28.020
9.919	27.445
10.853	29.020
11.708	29.289
12.863	30.301
13.831	30.661
14.800	31.769
15.804	31.848
16.850	33.889
17.853	33.875
18.895	33.954];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Weim2007';
comment.tL_m = 'Data for males';

% time-weight
% females
data.tW_f = [ ... % time since birth (yr), wet weight (g)
5.025	116.050
5.997	205.058
6.970	316.454
7.945	472.625
8.921	643.720
9.936	844.644
10.875	1023.223
11.923	1142.040
12.860	1283.306
13.832	1387.240
14.841	1468.765
15.774	1542.869
16.855	1601.965
17.825	1657.393
18.794	1709.089
19.837	1742.088];
data.tW_f(:,1) = 365 * data.tW_f(:,1);
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(18);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Weim2007';
comment.tW_f = 'Data for females';
% males
data.tW_m = [ ... % time since birth (yr), wet weight (g)
1.005	17.553
1.934	9.571
3.013	31.355
3.980	45.739
5.023	75.006
5.992	126.702
7.036	167.163
8.005	218.859
8.973	248.168
9.943	303.596
10.874	336.657
11.916	354.730
12.922	398.943
13.816	424.562
14.858	453.830
15.862	453.268
16.904	471.341
17.909	493.167
18.913	503.799
19.807	533.149];
data.tW_m(:,1) = 365 * data.tW_m(:,1);
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(18);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Weim2007';
comment.tW_m = 'Data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
37  13.2e3
43  28.6e3
49  51.2e3
55  76.8e3
60 108.3e3];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Weim2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 3;
weights.tW_m = weights.tW_m * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f', 'tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}, E_Hp and del_M only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'KMZ5'; % Cat of Life
metaData.links.id_ITIS = '163619'; % ITIS
metaData.links.id_EoL = '211593'; % Ency of Life
metaData.links.id_Wiki = 'Barbus_barbus'; % Wikipedia
metaData.links.id_ADW = 'Barbus_barbus'; % ADW
metaData.links.id_Taxo = '43752'; % Taxonomicon
metaData.links.id_WoRMS = '154292'; % WoRMS
metaData.links.id_fishbase = 'Barbus-barbus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_barbus}}';  
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
bibkey = 'Weim2007'; type = 'Techreport'; bib = [ ...  
'author = {P. A. D. M. Weimans}, ' ...
'year = {2007}, ' ...
'title = {Kennisdocument barbeel, \emph{Barbus barbus} ({L}innaeus, 1758)}, ' ... 
'institution = {Sportvisserij Nederland}, ' ...
'series = {Kennisdocument}, ' ...
'volume = {14}, '...
'howpublished = {\verb+\url{http://www.sportvisserijnederland.nl/files/kennisdocument-barbeel_4545.pdf}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

