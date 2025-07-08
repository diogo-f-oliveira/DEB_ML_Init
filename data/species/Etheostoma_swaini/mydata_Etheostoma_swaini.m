  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_swaini
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_swaini'; 
metaData.species_en = 'Gulf darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 24];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 24]; 

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'RuplMcMi1984';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'RuplMcMi1984'; 
  comment.Lp = 'based on LN data';
data.Li = 7.8;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 1.3e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'RuplMcMi1984';
  comment.Wwb = 'based on egg diameter of 1.35 mm: pi/6*0.135^3';
data.Wwi = 3.25; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
   comment.Wwi = 'based on 0.00513*Li^3.14 (see F1)';


% univariate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.299	1.631
0.382	2.056
0.479	2.246
0.533	2.428
0.621	2.625
0.676	2.823
0.856	2.657
0.967	2.681
1.072	2.939
1.123	3.038
1.248	2.941
1.059	2.932
1.105	3.303
1.227	3.274
1.302	3.509
1.341	3.562
1.469	3.859
1.531	3.435
1.603	3.640
1.691	3.436
1.862	3.680
1.945	3.688
2.021	4.166
2.123	3.674
2.184	4.182
2.038	3.780
2.122	4.348
2.183	3.909
2.263	4.009
2.347	4.191
2.433	4.502
2.509	4.291
2.604	4.678
2.852	4.074
2.933	4.279
3.100	4.371
3.014	5.082];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.86; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuplMcMi1984';

% length - fecundity
data.LN = [ ... % std length (cm), frecundity (#)
2.83 11
2.84 14
2.94  7
3.14 15
3.42 27
3.43 23
3.56 39
3.57 13
3.64 70
3.78 32
4.62 59
4.64 84
4.65 62
5.04 90];
data.LN(:,1) = data.LN(:,1)/ 0.86; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'RuplMcMi1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  30 * weights.tL;
weights.Li =  3 * weights.Li;
weights.Wwi =  3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v =  2 * weights.psd.v;
weights.psd.p_M =  3 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6H4T4'; % Cat of Life
metaData.links.id_ITIS = '168439'; % ITIS
metaData.links.id_EoL = '203739'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_swaini'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_swaini'; % ADW
metaData.links.id_Taxo = '174158'; % Taxonomicon
metaData.links.id_WoRMS = '1378188'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-swaini'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_swaini}}';  
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
bibkey = 'RuplMcMi1984'; type = 'article'; bib = [ ...  
'author = {David L. Ruple and Robert H. McMichael and John A. Baker}, ' ...
'year = {1984}, ' ...
'title = {Life history of the gulf darter, \emph{Etheostoma swaini} ({P}isces: {P}ercidae)}, ' ... 
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {11(2)}, '...
'pages = {121-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-swaini.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
