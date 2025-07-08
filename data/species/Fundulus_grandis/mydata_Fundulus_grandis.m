  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_grandis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_grandis'; 
metaData.species_en = 'Gulf killifish';

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MAW','MAg','THn'};
metaData.ecoCode.habitat = {'0iMm','0iFe'};
metaData.ecoCode.embryo  = {'Ms','Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 14]; 

%% set data
% zero-variate data
data.am = 3*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'fishbase';
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Li = 18;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 7;     units.Wwp = 'g';     label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'PattAllg2013'; 
data.Wwi = 44.3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.00603*Li^3.08, see F1';

data.Ri = 12858/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishesoftexas';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [ ... % weight (g), age (yr)
0.036	1.138
0.056	1.334
0.056	1.530
0.056	1.021
0.068	1.373
0.072	1.569
0.088	2.157
0.092	1.687
0.096	1.100
0.108	2.040
0.120	2.432
0.128	2.823
0.136	2.549
0.144	1.845
0.148	3.059
0.152	2.824
0.156	3.842
0.160	4.430
0.164	3.725
0.168	3.881
0.180	4.273
0.184	4.548
0.184	3.764
0.196	4.195
0.216	4.626
0.572	4.867
0.572	5.024
0.572	5.337
0.580	5.690
0.580	6.394
0.580	6.825
0.580	7.060
0.584	5.885
0.584	6.081
0.584	6.238
0.820	8.670
0.820	9.179
0.824	6.633
0.824	6.907
0.824	9.336
0.824	9.492
0.828	7.142
0.828	7.260
0.828	7.377
0.828	8.474
0.828	9.884
0.832	6.124
0.832	7.573
0.832	7.808
0.992	7.889
1.240	8.089
1.240	8.402
1.244	8.598
1.244	8.755
1.244	8.872
1.244	9.068
1.244	9.225
1.248	6.092
1.248	6.953
1.248	7.188
1.248	7.384
1.248	7.932
1.248	10.596
1.252	7.776
1.832	12.876
2.256	7.831];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VastAbie2017';

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
                  
%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K3F7'; % Cat of Life
metaData.links.id_ITIS = '165651'; % ITIS
metaData.links.id_EoL = '46566778'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_grandis'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_grandis'; % ADW
metaData.links.id_Taxo = '192754'; % Taxonomicon
metaData.links.id_WoRMS = '276030'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-grandis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_parvipinnis}}';
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
bibkey = 'VastAbie2017'; type = 'Article'; bib = [ ...  
'doi = {10.1007/s10641-017-0645-7}, ' ...
'author = {Anthony R. Vastano and Kenneth W. Able and Olaf P. Jensen and Paola C. L\''{o}pez-Duarte and Charles W. Martin and Brian J. Roberts}, ' ...
'year = {2017}, ' ...
'title = {Age validation and seasonal growth patterns of a subtropical marsh fish: The {G}ulf Killifish, \emph{Fundulus grandis}}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {100}, '...
'pages = {1315-1327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'PattAllg2013'; type = 'Article'; bib = [ ...  
'author = {Joshua T. Patterson and Taylor G. Allgood and Christopher C. Green}, ' ...
'year = {2013}, ' ...
'title = {Intraspecific variation in reproductive potential with maternal body size in Gulf killifish \emph{Fundulus grandis}}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {384-387}, '...
'pages = {134-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-parvipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/fundulus grandis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


