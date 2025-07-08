function [data, auxData, metaData, txtData, weights] = mydata_Paralonchurus_brasiliensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Paralonchurus_brasiliensis'; 
metaData.species_en = 'Banded croaker'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 02];

%% set data
% zero-variate data

data.am = 21*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'SantCost2017';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 33.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.1e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'CostDias2015';
  comment.Wwb = 'based on egg diameter of 0.693 mm: pi/6*0.0993^3';
data.Wwp = 36.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00759*Lp^3.08, see F1';
data.Wwi = 385;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00759*Li^3.08, see F1; max published weight 520 g';
 
% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (d), total length (cm)
2	12.736
3	16.239
4	19.113
5	20.475
7	23.324];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length'};  
temp.tL_f    = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LewiFont2005';
comment.tL_f = 'Data for females';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.643	7040.930
16.513	15416.456
16.624	13331.605
16.691	4652.122
17.983	24797.519
18.095	13262.120
18.162	15351.865
18.340	24038.081
18.518	18218.803
18.674	7563.751
18.986	13176.714
19.120	21641.927
19.253	36700.544
19.588	35610.826
19.922	21114.515
20.256	12881.941
21.593	24786.803
24.000	33973.801];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CostDias2015';

% length-weight
data.LW = [ ... % totla length (cm), weight (g)
12.243	15.341
12.579	17.386
12.736	20.966
13.162	23.011
13.184	18.920
13.274	20.966
13.341	18.920
13.431	22.500
13.499	24.034
13.655	19.943
13.722	19.432
13.812	20.966
13.812	23.523
13.969	23.011
13.992	23.011
13.992	25.568
14.014	20.455
14.171	26.591
14.284	29.148
14.463	28.125
14.463	31.193
14.485	25.568
14.642	29.148
14.666	36.307
14.754	26.591
14.799	29.659
14.799	31.193
14.888	26.080
14.956	30.682
15.092	41.420
15.181	34.261
15.225	30.170
15.337	32.216
15.472	35.795
15.517	34.261
15.652	38.864
15.697	40.909
15.741	38.864
15.876	38.352
15.966	40.398
16.034	45.511
16.055	35.284
16.056	42.955
16.144	35.795
16.190	41.932
16.235	45.511
16.279	39.375
16.325	49.091
16.437	42.955
16.437	48.068
16.461	56.761
16.481	38.864
16.526	41.932
16.572	47.045
16.616	42.443
16.662	52.159
16.728	41.420
16.728	44.489
16.729	50.114
16.774	54.205
16.840	45.511
16.864	52.670
16.953	46.534
16.976	52.670
17.042	46.023
17.109	42.443
17.110	51.648
17.133	55.227
17.176	44.489
17.177	50.625
17.221	45.511
17.266	46.023
17.290	57.273
17.311	50.114
17.335	56.761
17.379	55.739
17.401	47.557
17.424	50.625
17.469	51.648
17.470	59.830
17.514	54.716
17.536	53.693
17.537	59.830
17.558	48.580
17.559	55.739
17.582	59.830
17.605	65.455
17.670	49.602
17.716	60.852
17.717	65.455
17.783	55.739
17.851	65.966
17.872	51.648
17.873	57.784
17.917	55.227
17.918	59.830
17.964	69.545
17.985	63.920
18.006	52.670
18.009	73.636
18.076	68.011
18.097	60.852
18.120	66.989
18.232	61.364
18.276	59.318
18.322	63.920
18.367	71.591
18.389	68.523
18.411	58.807
18.456	60.341
18.502	71.591
18.569	67.500
18.590	60.341
18.613	65.455
18.614	74.148
18.681	66.989
18.681	73.636
18.749	74.659
18.793	69.034
18.794	75.170
18.815	65.966
18.837	64.943
18.860	70.568
18.905	66.477
18.927	66.989
18.950	71.080
18.972	71.591
18.973	78.239
18.974	82.841
18.994	61.364
18.994	64.943
18.994	68.011
19.085	73.125
19.085	76.705
19.130	80.284
19.175	80.795
19.197	73.125
19.242	75.170
19.287	79.261
19.287	82.330
19.376	71.591
19.376	74.659
19.377	78.239
19.422	81.818
19.443	68.523
19.443	75.170
19.488	75.682
19.511	77.216
19.511	80.795
19.512	82.330
19.602	86.420
19.623	78.750
19.669	84.375
19.690	75.682
19.712	74.148
19.737	88.977
19.759	93.580
19.779	73.125
19.802	77.216
19.803	81.818
19.870	83.864
19.871	85.909
19.871	87.443
19.894	91.534
19.959	79.261
20.027	84.375
20.028	87.443
20.117	81.307
20.118	89.489
20.229	81.307
20.229	84.375
20.298	96.136
20.318	79.773
20.319	87.443
20.320	99.716
20.342	92.045
20.386	86.420
20.388	101.761
20.454	93.580
20.476	89.489
20.478	103.295
20.522	95.625
20.568	108.920
20.589	93.580
20.589	97.159
20.634	98.693
20.635	104.318
20.678	91.534
20.724	98.693
20.768	92.557
20.792	103.807
20.857	91.023
20.925	93.068
20.971	103.807
20.993	101.250
20.995	114.034
21.129	113.523
21.171	91.534
21.238	93.068
21.241	114.545
21.306	96.648
21.308	108.409
21.308	111.477
21.330	105.341
21.468	139.091
21.487	109.432
21.553	99.716
21.553	103.295
21.577	116.080
21.644	107.386
21.778	108.920
21.781	132.955
21.823	104.830
21.892	120.170
22.027	128.352
22.227	114.545
22.253	143.693
22.364	134.489
22.409	138.580
22.497	123.239
22.610	129.375
23.575	143.182];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'LewiFont2005';
comment.LW = 'Data for females';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'no data for males';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00759*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4CZXV'; % Cat of Life
metaData.links.id_ITIS = '169344'; % ITIS
metaData.links.id_EoL = '46579203'; % Ency of Life
metaData.links.id_Wiki = 'Paralonchurus'; % Wikipedia
metaData.links.id_ADW = 'Paralonchurus_brasiliensis'; % ADW
metaData.links.id_Taxo = '182930'; % Taxonomicon
metaData.links.id_WoRMS = '282063'; % WoRMS
metaData.links.id_fishbase = 'Paralonchurus-brasiliensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralonchurus_brasiliensis}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Paralonchurus_brasiliensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LewiFont2005'; type = 'Article'; bib = [ ... 
'author = {D. dos S. Lewis and N. F. Fontoura}, ' ...
'year = {2005}, ' ...
'title  = {Maturity and growth of \emph{Paralonchurus brasiliensis} females in southern {B}razil ({T}eleostei, {P}erciformes, {S}ciaenidae)}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {21(2)}, ' ...
'pages = {94–100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CostDias2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-015-0432-2}, ' ...
'author = {Eudriano FS Costa and June F Dias and Hilario Murua}, ' ...
'year = {2015}, ' ...
'title  = {Reproductive strategy and fecundity of the keystone species \emph{Paralonchurus brasiliensis} ({T}eleostei, {S}ciaenidae): an image processing techniques application}, ' ...
'journal = {Environ. Biol. Fish}, ' ...
'volume = {98}, ' ...
'pages = {2093–2108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

