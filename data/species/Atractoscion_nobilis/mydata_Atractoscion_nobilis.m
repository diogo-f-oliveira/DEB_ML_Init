function [data, auxData, metaData, txtData, weights] = mydata_Atractoscion_nobilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Atractoscion_nobilis'; 
metaData.species_en = 'White seabass'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author         = {'Bas Kooijman'};    
metaData.date_subm      = [2019 01 16];              
metaData.email          = {'bas.kooijman@vu.nl'};            
metaData.address        = {'VU University Amsterdam'};   

metaData.curator        = {'Starrlight Augustine'};
metaData.email_cur      = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc       = [2019 01 16];

%% set data
% zero-variate data


data.am = 28*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'RomoHerz2015';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 61;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'Anon2001'; 
data.Li  = 166;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter og 0.8 mm: pi/6*0.08^3';
data.Wwp = 2e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Anon2001','fishbase'};
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 41e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri = 8e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap = 0.90';
 
% uni-variate data
% t-L data
data.tL = [ ... % yr class (yr), total length (cm)
0.039	32.795
0.928	31.677
0.928	33.540
0.928	35.776
0.928	37.640
0.928	48.820
0.928	49.938
0.928	51.429
0.928	52.547
0.928	54.037
0.928	54.783
0.928	56.273
0.928	57.391
0.928	67.081
0.928	71.180
0.966	40.994
0.966	60.373
0.966	62.236
1.005	45.093
1.005	47.702
1.933	38.758
1.933	68.571
1.933	69.317
1.933	71.925
1.933	74.534
2.010	51.801
2.010	56.273
2.010	59.255
2.010	60.745
2.010	62.236
2.010	63.727
2.010	65.590
2.010	66.708
2.010	79.006
2.049	45.839
2.899	72.298
2.938	45.839
2.938	69.689
2.938	74.161
2.977	48.447
2.977	51.056
2.977	57.391
2.977	59.255
2.977	64.845
2.977	66.708
2.977	75.280
2.977	77.143
2.977	78.261
2.977	80.870
2.977	82.733
2.977	82.733
2.977	87.205
2.977	89.441
2.977	91.304
2.977	93.168
2.977	96.149
2.977	98.758
3.015	80.497
3.054	86.832
3.943	68.199
3.943	105.466
3.982	82.360
3.982	84.969
3.982	87.205
3.982	88.323
3.982	88.696
3.982	91.304
3.982	92.050
3.982	94.286
3.982	96.894
3.982	98.012
4.021	76.770
4.948	95.404
4.948	96.522
4.948	98.012
4.987	90.559
4.987	93.540
5.026	105.093
5.026	109.938
5.915	96.522
5.915	109.193
5.954	89.068
5.954	103.602
5.954	106.957
5.954	107.702
5.954	111.056
5.954	112.919
5.992	105.466
6.843	109.565
6.920	114.410
6.920	116.273
6.920	118.137
6.920	120.000
6.959	96.894
6.959	100.994
6.959	106.957
6.959	121.863
6.959	122.981
7.887	136.770
7.925	93.540
7.925	116.273
7.925	121.118
7.925	123.354
7.964	103.975
7.964	109.938
7.964	112.919
7.964	114.037
8.003	99.503
8.892	94.286
8.930	106.584
8.930	110.683
8.969	115.901
8.969	118.137
8.969	120.373
8.969	121.863
8.969	122.236
8.969	124.099
8.969	127.453
8.969	130.807
8.969	133.789
9.820	120.000
9.820	121.118
9.820	123.727
9.820	124.845
9.820	126.335
9.858	117.391
9.897	112.919
9.897	115.901
9.897	128.571
9.897	139.752
9.936	103.602
10.941	109.938
10.941	113.665
10.941	115.901
10.941	120.373
10.979	145.714
11.018	124.099
11.018	125.963
11.018	127.453
11.018	127.826
11.018	128.571
11.018	129.317
11.018	131.180
11.018	134.534
11.057	124.099
11.907	131.925
11.907	134.534
11.907	136.398
11.907	139.006
11.946	117.019
11.946	119.627
11.946	121.118
11.946	122.609
11.946	124.099
11.946	124.845
11.946	126.335
12.912	118.882
12.951	121.491
12.951	123.727
12.951	125.590
12.951	126.335
12.951	127.826
12.951	128.571
12.951	129.689
12.951	132.298
12.951	135.280
13.067	141.988
13.918	116.273
13.918	120.373
13.918	121.863
13.918	123.727
13.918	124.845
13.918	127.453
13.918	130.062
13.918	131.180
13.918	132.298
13.918	133.789
13.918	135.280
13.918	137.888
13.918	138.634
13.918	139.752
13.918	145.714
13.918	151.677
13.956	143.478
14.845	120.745
14.923	122.981
14.923	127.826
14.923	129.317
14.923	132.671
14.923	133.789
14.923	134.534
14.923	138.261
14.923	140.870
14.923	141.988
14.961	131.553
14.961	136.770
14.961	137.888
15.039	146.087
15.928	118.882
15.928	128.944
15.966	132.298
15.966	136.025
16.005	131.553
16.005	134.161
16.005	137.888
16.005	139.752
16.005	156.522
16.894	132.298
16.894	134.907
16.894	135.280
16.894	137.516
16.894	138.634
16.894	141.988
17.010	131.180
17.938	124.845
17.938	128.571
17.938	133.416
17.938	136.770
17.938	140.497
18.905	140.870
18.982	136.770
18.982	138.261
19.021	145.714
19.059	131.925
19.948	127.081
19.987	141.242
19.987	142.733
20.026	147.205
20.026	155.031
20.954	134.161
20.992	141.242
21.959	139.752
21.959	146.832
22.036	136.770
23.930	127.826
24.008	145.342
24.974	138.634
26.057	142.733
27.062	147.205
27.912	141.988];
data.tL(:,1) = (.75 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RomoHerz2015';
comment.tL = 'Data from several locations';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g  = 0.00871*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; demersal. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'JJR6'; % Cat of Life
metaData.links.id_ITIS = '169387'; % ITIS
metaData.links.id_EoL = '46579091'; % Ency of Life
metaData.links.id_Wiki = 'Atractoscion_nobilis'; % Wikipedia
metaData.links.id_ADW = 'Atractoscion_nobilis'; % ADW
metaData.links.id_Taxo = '162587'; % Taxonomicon
metaData.links.id_WoRMS = '278535'; % WoRMS
metaData.links.id_fishbase = 'Atractoscion-nobilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atractoscion_nobilis}}';
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
bibkey = 'RomoHerz2015'; type = 'Article'; bib = [ ... 
'author = {Alfonsina E. Romo-Curiel and Sharon Z. Herzka and Oscar Sosa-Nishizaki and Chugey A. Sepulveda and Scott A. Aalbers}, ' ... 
'year = {2015}, ' ...
'title = {Otolith-based growth estimates and insights into populationstructure of White Seabass, \emph{Atractoscion nobilis}, off the {P}acific coast of {N}orth {A}merica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {161}, ' ...
'pages = {374-383}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Anon2001'; type = 'techreport'; bib = [ ... 
'author = {Anonymous}, ' ... 
'year = {2001}, ' ...
'title = {White seabass}, ' ...
'institution = {California Department of Fish and Game}, ' ...
'volume = {207}, ' ...
'series = {California''s Marine Living Resources}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Atractoscion-nobilis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

