  function [data, auxData, metaData, txtData, weights] = mydata_Ammocrypta_beanii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Ammocrypta_beanii'; 
metaData.species_en = 'Naked sand darter';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp

metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 29]; 

%% set data
% zero-variate data
data.am = 2*365;   units.am = 'd';  label.am = 'life span';                     bibkey.am = 'HemsRook1984';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;  units.Lp = 'cm'; label.Lp = 'standard length at puberty for females';  bibkey.Lp = 'HemsRook1984'; 
data.Li = 7.2;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HemsRook1984';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 2.52; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1';

% univariate data

% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
3 3.589
4 3.920
6 4.138	
9 4.436];
data.tL(:,1) = 30.5 * (9 + data.tL(:,1));  % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.86;  % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HemsRook1984';

% length - fecundity
data.LN = [ ... % standard length (cm), fecundity (#)
3.504	71.285
3.509	27.231
3.525	55.934
3.567	40.979
3.578	36.792
3.617	37.187
3.625	54.927
3.632	41.172
3.632	36.787
3.633	69.876
3.734	61.494
3.761	42.555
3.778	63.683
3.810	47.533
3.811	42.749
3.818	61.885
3.835	48.129
3.844	57.297
3.844	55.703
3.844	50.719
3.858	60.286
3.859	53.907
3.901	37.159
3.911	73.237
3.917	68.453
3.920	84.001
3.922	70.246
3.925	42.538
3.963	58.681
3.965	37.551
4.005	81.600
4.018	91.765
4.038	52.893
4.085	78.602
4.116	63.848
4.141	64.244
4.147	57.068
4.200	68.425
4.226	61.047
4.311	61.237
4.362	89.139
4.382	88.340
4.437	83.152
4.439	73.384
4.464	106.073
4.530	101.681
4.559	103.073
4.570	98.687
4.580	95.297
4.583	111.642
4.591	89.116
4.594	100.478
4.595	97.488
4.627	78.149
4.649	100.473
4.652	120.007
4.834	92.880];
data.LN(:,1) = data.LN(:,1)/ 0.86; % convert SL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HemsRook1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.86 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'CTHP'; % Cat of Life
metaData.links.id_ITIS = '553376'; % ITIS
metaData.links.id_EoL = '1156875'; % Ency of Life
metaData.links.id_Wiki = 'Ammocrypta_beanii'; % Wikipedia
metaData.links.id_ADW = 'Ammocrypta_beanii'; % ADW
metaData.links.id_Taxo = '244203'; % Taxonomicon
metaData.links.id_WoRMS = '1020166'; % WoRMS
metaData.links.id_fishbase = 'Ammocrypta-beanii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ammocrypta_beanii}}';  
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
bibkey = 'HemsRook1984'; type = 'incollection'; bib = [ ...
'isbn = {90-6193-506-7}, ' ...
'author = {David C. Hems and J. Russell Rooks}, ' ...
'year = {1984}, ' ...
'title = {Life history of the naked sand darter, \emph{Ammocrypta beani}, in southeastern {M}ississippi}, ' ... 
'booktitle = {Environmental biology of darters}, ' ...
'editor = {David G. Linquist and Lawrence M. Page}, '...
'publisher = {Dr. W. Junk Publ., The Hague}, ' ...
'pages = {714-722}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ammocrypta-beanii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
