function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_morio

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_morio'; 
metaData.species_en = 'Red grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2018 12 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 21]; 

%% set data
% zero-variate data

data.am = 25 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 50;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 125;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwi = 23000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri  = 17e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(23);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), otolith radius (mm)
0.986	1.808
0.987	1.693
0.988	1.612
0.989	1.497
1.971	2.824
1.972	2.663
1.973	2.594
1.974	2.501
1.976	1.994
1.977	1.925
1.978	1.832
1.992	2.928
1.993	2.778
1.995	2.409
1.996	2.340
1.996	2.271
2.011	3.217
2.019	2.144
2.019	2.063
2.955	3.944
2.981	3.321
2.982	3.137
2.983	2.998
3.000	3.714
3.001	3.494
3.002	3.402
3.003	3.218
3.005	2.906
3.006	2.814
3.006	2.756
3.007	2.664
3.008	2.594
3.008	2.468
3.009	2.387
3.022	3.587
3.969	3.818
3.970	3.726
3.988	4.164
3.989	4.072
3.989	4.049
3.990	3.980
3.990	3.911
3.992	3.576
3.993	3.437
3.994	3.380
4.007	4.557
4.009	4.291
4.016	3.264
4.019	2.907
4.019	2.826
4.036	3.495
4.039	3.161
4.039	3.091
4.040	2.999
4.962	3.646
4.979	4.257
4.980	4.165
4.981	4.027
4.982	3.888
4.983	3.819
4.983	3.750
4.984	3.577
4.985	3.473
4.986	3.415
4.989	2.942
4.998	4.707
4.999	4.604
5.000	4.465
5.000	4.407
5.008	3.334
5.009	3.150
5.010	3.034
5.927	4.420
5.954	3.635
5.955	3.554
5.968	4.743
5.968	4.685
5.969	4.581
5.970	4.500
5.973	3.970
5.974	3.889
5.975	3.797
5.975	3.727
5.977	3.427
5.993	4.293
5.994	4.062
6.015	4.212
6.015	4.154
6.962	4.501
6.964	4.097
6.965	3.982
6.968	3.613
6.984	4.340
6.987	3.913
7.003	4.697
7.004	4.559
7.006	4.247
7.007	4.167
7.976	4.421
7.996	4.560
7.997	4.467
8.944	4.745
8.966	4.572
8.967	4.491
8.968	4.376
8.984	5.091
8.985	4.953
9.959	4.469
9.960	4.388
9.975	5.230
9.977	5.000
9.998	5.115
10.943	5.577
10.969	4.908
10.970	4.769
10.971	4.700
11.939	5.012
11.959	5.162
11.961	4.932
11.961	4.886
11.964	4.482
12.929	5.209
12.950	5.359
12.968	5.809
12.997	4.782
13.941	5.487
13.983	5.649
16.012	5.304];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = (171+178*data.tL(:,2))/10; % convert otolith radius in mm to total length in cm
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'otolith radius'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jone2000';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6G626'; % Cat of Life
metaData.links.id_ITIS = '167702'; % ITIS
metaData.links.id_EoL = '46579618'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_morio'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_morio'; % ADW
metaData.links.id_Taxo = '45076'; % Taxonomicon
metaData.links.id_WoRMS = '159354'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-morio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_morio}}';
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
bibkey = 'Jone2000'; type = 'Article'; bib = [ ... 
'author = {Cynthia M. Jones}, ' ... 
'year = {2000}, ' ...
'title = {Fitting growth curves to retrospective size-at-age data}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {46}, ' ...
'number = {3}, '...
'pages = {123-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-morio.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

