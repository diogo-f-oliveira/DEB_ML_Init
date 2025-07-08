function [data, auxData, metaData, txtData, weights] = mydata_Rhinolophus_mehelyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Rhinolophidae';
metaData.species    = 'Rhinolophus_mehelyi'; 
metaData.species_en = 'Mehely''s horseshoe bat'; 

metaData.ecoCode.climate = {'BSk','BWk','Csa','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 24]; 

%% set data
% zero-variate data

data.tg = 90;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at first litter ';   bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 33*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'Shar2004';
data.Wwi = 12.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Shar2004';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'MacDBarr1993';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.054	3.483
1.120	3.704
1.186	3.990
1.187	4.189
4.874	5.466
5.071	6.017
5.072	6.282
5.073	6.480
8.891	8.397
8.957	9.014
8.958	9.631
8.959	9.896
9.023	10.160
9.024	10.249
13.897	9.453
13.963	10.423
13.964	10.644
13.965	10.908
14.094	9.806
14.095	11.658
21.076	10.443
21.077	11.501
21.142	10.751
21.143	11.038
21.207	11.324
21.208	12.383
27.925	11.410
27.991	10.176
27.992	10.440
28.057	9.713
28.058	10.969
34.973	12.003
35.038	11.650
35.104	10.768
35.105	11.341
35.170	11.121
41.888	11.361
41.954	11.603
41.955	11.736
41.956	11.868
41.957	12.265
42.151	12.596
48.869	11.976
48.934	11.358
48.935	12.130
48.936	12.240
49.001	12.417
49.002	12.615
56.114	12.172
56.115	12.348
56.180	12.524
56.181	12.612];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Shar2004';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4S98M'; % Cat of Life
metaData.links.id_ITIS = '631446'; % ITIS
metaData.links.id_EoL = '308547'; % Ency of Life
metaData.links.id_Wiki = 'Rhinolophus_mehelyi'; % Wikipedia
metaData.links.id_ADW = 'Rhinolophus_mehelyi'; % ADW
metaData.links.id_Taxo = '64147'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800604'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinolophus_mehelyi}}';
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
bibkey = 'Shar2004'; type = 'Article'; bib = [ ... 
'doi = {10.3161/001.006.0112}, ' ...
'author = {Sharifi, Mozafar}, ' ... 
'year = {2004}, ' ...
'title = {Postnatal Growth and Age Estimation in the {M}ehely''s Horseshoe Bat (\emph{Rhinolophus mehelyi})}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {6(1)}, ' ...
'pages = {155-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacDBarr1993'; type = 'Book'; bib = [ ...  
'author = {David MacDonald and Priscilla Barrett}, ' ...
'year = {1993}, ' ...
'title  = {Mammals of Britain and Europe}, ' ...
'publisher = {HarperCollins, London}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

