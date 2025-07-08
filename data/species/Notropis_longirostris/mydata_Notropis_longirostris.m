function [data, auxData, metaData, txtData, weights] = mydata_Notropis_longirostris
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_longirostris'; 
metaData.species_en = 'Longnose shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 14]; 

%% set data
% zero-variate data

data.am = 1.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'HeinClem1976';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 2.95;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'HeinClem1976'; 
data.Li = 5.4;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishbase'; 
  comment.Li = 'based on TL 6.5 cm, and F2';  

data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HeinClem1976';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 1.58;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*(Li/0.83)^3.08, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (mnth), std length (cm)
 0.5  0.85
 1.0  1.34
 1.5  2.00
 2.5  2.56
 3.5  2.72
 4.5  2.89
 6.5  2.94
 7.5  3.13
 9.5  3.55
13.5  3.91
14.5  4.03
15.5  4.51
17.5  4.68];
data.tL(:,1) = 30.5 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeinClem1976'; 
comment.tL = 'Data from length frequency counts';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
3.263	23.164
3.345	20.807
3.364	30.320
3.421	44.597
3.441	18.452
3.464	28.680
3.517	44.619
3.531	28.696
3.598	39.409
3.612	50.347
3.688	72.235
3.689	46.087
3.861	57.538
3.899	68.958
3.904	85.361
3.919	57.552
3.985	95.602
3.991	71.356
4.005	65.417
4.027	118.433
4.034	58.530
4.039	61.621
4.063	62.816
4.091	70.667
4.296	103.046
4.401	129.220];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HeinClem1976'; 
comment.LN = 'Data from May till July';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed nor to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZHJ'; % Cat of Life
metaData.links.id_ITIS = '163452'; % ITIS
metaData.links.id_EoL = '47261981'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_longirostris'; % Wikipedia
metaData.links.id_ADW = 'Notropis_longirostris'; % ADW
metaData.links.id_Taxo = '181517'; % Taxonomicon
metaData.links.id_WoRMS = '1060178'; % WoRMS
metaData.links.id_fishbase = 'Notropis-longirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_longirostris}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-longirostris.html}}';  
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Notropis_longirostris/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeinClem1976'; type = 'article'; bib = [ ... 
'author = {David Heins and Glenn H. Clemmer}, ' ... 
'year = {1976}, ' ...
'title = {The reproductive biology, age and growth of the {N}orth {A}merican cyprinid, \emph{Notropis longirostris} ({H}ay)}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {8}, ' ...
'pages = {365-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

