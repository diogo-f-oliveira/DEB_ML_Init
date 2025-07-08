function [data, auxData, metaData, txtData, weights] = mydata_Andrias_davidianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Cryptobranchidae';
metaData.species    = 'Andrias_davidianus'; 
metaData.species_en = 'Chinese giant salamander'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'piCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 12]; 


%% set data
% zero-variate data

data.ab = 55;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '50 to 60 d';
data.ap = 5.5*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Wiki';
  temp.ap = C2K(14);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 60*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 45;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = '40 to 50 cm';
data.Li  = 150;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 0.221;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 7 to 8 mm: pi/6*0.75^3';
data.Wwi = 3e4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';

data.Ri  = 450/ 365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '400 to 500 eggs per clutch'; 

% univariate data

% time-length
data.tL = [ ... time since Oct 2009 (d), total length (cm)
   0	21.000
 182	26.000
 273	29.667
 822	44.667
1127	60.667
1461	73.333];
data.tL(:,1) = data.tL(:,1) + 550; % set origin at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZhanKoub2014';

% time-weight
data.tW = [ ... time since Oct 2009 (d), wet weight (g)
   0	41.371
 182	94.003
 273   112.286
 822   531.507
1127  1454.436
1461  2480.320];
data.tW(:,1) = data.tW(:,1) + 550; % set origin at birth
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(14);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ZhanKoub2014';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'DTJQ'; % Cat of Life
metaData.links.id_ITIS = '202085'; % ITIS
metaData.links.id_EoL = '1018725'; % Ency of Life
metaData.links.id_Wiki = 'Andrias_davidianus'; % Wikipedia
metaData.links.id_ADW = 'Andrias_davidianus'; % ADW
metaData.links.id_Taxo = '47246'; % Taxonomicon
metaData.links.id_WoRMS = '1398063'; % WoRMS
metaData.links.id_amphweb = 'Andrias+davidianus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Andrias_davidianus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Andrias_davidianus}}';
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
bibkey = 'ZhanKoub2014'; type = 'Article'; bib = [ ... 
'author = {L. Zhang and Andrew Kouba and Qijun Wang and H. Zhao and Wei Jiang and Scott Willard anf Hongxing Zhang}, ' ... 
'year = {2014}, ' ...
'title = {THE EFFECT OF WATER TEMPERATURE ON THE GROWTH OF CAPTIVE CHINESE GIANT SALAMANDERS (\emph{Andrias davidianus}) REARED FOR REINTRODUCTION: {A} COMPARISON WITH WILD SALAMANDER BODY CONDITION}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {70}, ' ...
'pages = {369-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?where-genus=Andrias&where-species=davidianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

