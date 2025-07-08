  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_malma
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_malma'; 
metaData.species_en = 'Dolly Varden trout'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THn', 'MPN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 26]; 

%% set data
% zero-variate data
data.am = 9*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'Esin2015';   
  temp.am = C2K(2.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23.5;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on Salvelinus_namaycush';
data.Li = 127;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 2.76e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'Esin2015';
  comment.Wwb = 'based on egg diameter of 3.75 mm: pi/6*0.375^3';
data.Wwi = 18.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 450/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'Esin2015';   
  temp.Ri = C2K(2.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [... % time since birth (yr), fork length (cm)
0.080	4.933
0.092	4.476
0.092	4.684
0.142	4.807
1.115	6.661
1.129	8.282
1.154	8.946
1.166	8.738
2.127	9.678
2.140	11.382
2.142	13.211
2.189	10.425
2.189	10.550
3.163	13.733
3.164	14.024
3.174	11.655
3.225	13.358
3.225	13.566
3.239	16.060
4.199	16.001
4.199	16.417
4.209	14.255
4.250	17.954
4.259	14.836
4.260	15.959
5.196	16.898
5.245	17.230
5.248	20.181
6.233	21.286
6.281	19.748
6.293	19.955
7.267	22.017];
data.tL(:,1) = 365 * (0.75 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'fork length'};  
temp.tL = C2K(2.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Esin2015';

% time-weight
data.tW = [... % time since birth (yr), wet weight (g)
-0.003	0.937
-0.003	1.097
-0.003	1.257
-0.003	1.577
0.982	7.747
0.982	8.227
0.994	3.269
1.044	6.144
1.991	10.078
1.992	15.036
1.992	16.315
2.016	10.716
2.018	22.070
2.029	12.794
3.001	15.448
3.003	28.400
3.026	20.883
3.042	44.229
3.064	25.518
3.064	26.957
4.038	39.205
4.085	28.328
4.087	40.961
4.100	40.480
4.111	37.441
5.052	74.318
5.072	46.971
5.073	49.210
6.047	67.855
6.107	54.258
6.107	58.736
6.994	66.672];
data.tW(:,1) = 365 * (0.75 + data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'};     label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(2.2); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Esin2015';

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
D1 = 'temperatures are guessed from preferred reperature a given in fishbase; known as a cold-water species';
metaData.discussion = struct('D1', D1);
                                 
%% Links
metaData.links.id_CoL = '79FQR'; % Cat of Life
metaData.links.id_ITIS = '162000'; % ITIS
metaData.links.id_EoL = '225241'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_malma'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_malma'; % ADW
metaData.links.id_Taxo = '42836'; % Taxonomicon
metaData.links.id_WoRMS = '254570'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-malma'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_malma}}';  
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
bibkey = 'Esin2015'; type = 'Article'; bib = [ ...  
'author = {E. V. Esin}, ' ...
'year = {2015}, ' ...
'title = {Stream resident {D}olly {V}arden \emph{Salvelinus malma} of {K}amchatka {P}eninsula}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {55}, '...
'pages = {224-239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-malma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
