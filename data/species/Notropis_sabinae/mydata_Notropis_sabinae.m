function [data, auxData, metaData, txtData, weights] = mydata_Notropis_sabinae

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_sabinae'; 
metaData.species_en = 'Sabine shiner'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 23]; 

%% set data
% zero-variate data

data.am = 2*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Hein1986';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.39;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Hein1986'; 
  comment.Lp = 'based on SL 3.55 cm and F2';
data.Li = 5.7;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 2.1e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Hein1986';
  comment.Wwb = 'based on egg diameter of 0.74 mm: pi/6*0.074^3';
data.Wwp = 0.67;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'Hein1986','fishbase'};
  comment.Wwi = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 1.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
220 3.241
380 3.250
310 3.590
340 3.643
370 3.763
400 3.926
430 4.045
460 3.485
490 3.833
520 3.858
550 4.268];
data.tL(:,2) = data.tL(:,2)/ 0.81; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hein1986'; 
comment.tL = 'Data from Big Cow Creek; origin is guessed';

% length - fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
3.553	206.593
3.591	173.626
3.598	142.308
3.682	112.088
3.689	197.253
3.689	142.308
3.697	213.187
3.697	123.077
3.735	197.253
3.750	190.110
3.758	140.110
3.773	147.253
3.818	162.637
3.826	186.264
3.826	180.220
3.826	120.330
3.833	153.297
3.856	189.560
3.856	150.549
3.894	157.143
3.917	275.275
3.924	169.780
3.939	203.297
3.939	192.857
4.023	133.516
4.038	123.626
4.098	198.901
4.098	162.637
4.129	265.934
4.136	131.319
4.174	260.989
4.189	191.758
4.197	260.440
4.212	241.758
4.235	195.055
4.250	247.253
4.250	224.176
4.265	309.341
4.265	189.011
4.280	256.044
4.295	304.396
4.295	226.923
4.311	237.363
4.333	201.099
4.356	265.934
4.394	210.440
4.402	309.341
4.402	336.813
4.402	232.967
4.424	340.110
4.432	187.363
4.492	274.725
4.500	325.824
4.523	307.692
4.523	331.868
4.576	396.154
4.576	274.725
4.614	423.626
4.674	312.088
4.803	348.352];
data.LN(:,1) = data.LN(:,1)/ 0.81; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Hein1986'; 
comment.LN = 'Data from Big cow Creek 1973/4 and Bayou Anacoco 1976/7';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is the preferred one, but varied between 7 and 27 C';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZK2'; % Cat of Life
metaData.links.id_ITIS = '163463'; % ITIS
metaData.links.id_EoL = '208005'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_sabinae'; % Wikipedia
metaData.links.id_ADW = 'Notropis_sabinae'; % ADW
metaData.links.id_Taxo = '181541'; % Taxonomicon
metaData.links.id_WoRMS = '1009328'; % WoRMS
metaData.links.id_fishbase = 'Notropis-sabinae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_sabinae}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-sabinae.html}}';  
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
bibkey = 'Hein1986'; type = 'Article'; bib = [ ... 
'author = {David C. Heins}, ' ... 
'year = {1981}, ' ...
'title = {Life History pattern of \emph{Notropis sabinae} ({P}isces: {C}yprinidae in the lower {S}abine {R}iver dranage of {L}ouisiana and {T}exas}, ' ...
'journal = {Tulane Studies in Zoology and Botany}, ' ...
'volume = {22(2)}, ' ...
'pages = {67-85}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

