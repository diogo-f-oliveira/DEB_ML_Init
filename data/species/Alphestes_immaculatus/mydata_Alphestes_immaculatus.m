function [data, auxData, metaData, txtData, weights] = mydata_Alphestes_immaculatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Alphestes_immaculatus'; 
metaData.species_en = 'Pacific mutton hamlet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 30;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 143;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01585*Lp^3.04, see F1';
data.Wwi = 1e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.04, see F1';

data.GSI = 0.07; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Eria2008';
  temp.GSI = C2K(25.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.018	15.027
0.030	13.309
0.064	14.436
0.066	10.465
0.077	12.880
0.089	12.451
0.999	14.812
1.010	16.530
1.021	18.086
1.021	17.174
1.023	13.578
1.023	13.202
1.033	17.496
1.033	17.335
1.033	16.744
1.034	15.725
1.034	15.456
1.034	14.114
1.057	16.208
1.991	17.925
2.003	16.047
2.004	14.275
2.014	17.227
2.014	16.905
2.015	16.583
2.015	16.583
2.015	16.315
2.025	19.803
2.025	19.052
2.026	18.408
2.037	18.676
2.037	17.710
2.038	15.725
2.049	19.320
2.985	14.383
2.994	22.648
2.995	19.857
2.995	18.891
2.995	18.140
2.996	16.744
3.007	17.603
3.017	22.218
3.018	20.877
3.019	15.939
3.020	15.403
3.028	23.292
3.029	20.286
3.042	19.374
3.043	15.027
3.975	23.238
3.986	25.170
3.999	21.574
4.000	17.657
4.012	17.388
4.022	22.594
4.023	18.354
4.034	19.535
4.035	18.945
4.036	15.939
4.047	16.261
4.048	15.403
4.982	15.671
4.991	22.862
4.993	18.462
5.002	24.097
5.003	22.540
5.003	21.682
5.004	19.052
5.017	16.583
5.028	17.013
5.998	16.422
6.008	20.555
6.009	17.710
6.021	18.730
6.021	17.066
6.033	18.247
7.001	20.608
7.022	27.209
7.983	20.394
8.006	20.179
8.984	28.014
8.999	20.179];
data.tL(:,1) = (0.9+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(25.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Eria2008'; comment.tL = 'sexes combined';
      
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'C65B'; % Cat of Life
metaData.links.id_ITIS = '551079'; % ITIS
metaData.links.id_EoL = '46579795'; % Ency of Life
metaData.links.id_Wiki = 'Alphestes_immaculatus'; % Wikipedia
metaData.links.id_ADW = 'Alphestes_immaculatus'; % ADW
metaData.links.id_Taxo = '160471'; % Taxonomicon
metaData.links.id_WoRMS = '279568'; % WoRMS
metaData.links.id_fishbase = 'Alphestes-immaculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alphestes_immaculatus}}';
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
bibkey = 'Eria2008'; type = 'phdthesis'; bib = [ ... 
'author = {Erisman, Brad Edward}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive biology and evolution of epinephelid and serranid fishes ({P}erciformes, {E}pinephelidae, {S}erranidae)}, ' ...
'school = {UC San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Alphestes-immaculatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

