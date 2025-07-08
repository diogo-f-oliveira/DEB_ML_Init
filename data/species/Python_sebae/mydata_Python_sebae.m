function [data, auxData, metaData, txtData, weights] = mydata_Python_sebae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Python_sebae'; 
metaData.species_en = 'African rock python'; 

metaData.ecoCode.climate = {'BSh', 'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'star@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 05]; 


%% set data
% zero-variate data

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW: 65 till 80 d';
data.ap = 4*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'ADW';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'ADW';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: over 12 yr';
  
data.Lb  = 40;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'ADW';
  comment.Lb = '35 till 45';
data.Li  = 550;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Whit1974';
  comment.Li = 'Wiki: max 480 cm; ';
  
data.Wwb = 161; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on Wwi * (Lb/Lm)^3; consistent with ADW: eggs weigh 130 till 170 g';
data.Wwi = 89e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Whit1974';
  comment.Wwi = 'based on length-weight of P. molurus: (550/460)^3*52';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'ADW: 20 till 50 per clutch';
 
% uni-variate data

% time-length
data.tL = [ ... time (d), length (cm)
   0  53
 302 168
 482 213
1371 411 
1530 465
1765 488
2007 518];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Whit1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'ab is ignored, since, Like all pythons, this species is probably partially ovoviviparous: eggs start to develop, while still in the mother';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4QY54'; % Cat of Life
metaData.links.id_ITIS = '634785'; % ITIS
metaData.links.id_EoL = '1055462'; % Ency of Life
metaData.links.id_Wiki = 'Python_sebae'; % Wikipedia
metaData.links.id_ADW = 'Python_sebae'; % ADW
metaData.links.id_Taxo = '49853'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Python&species=sebae'; % ReptileDB
metaData.links.id_AnAge = 'Python_sebae'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Python_sebae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Python_sebae/}}';
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
bibkey = 'Whit1974'; type = 'Article'; bib = [ ... 
'author = {Whitworth, J.}, ' ... 
'doi = {10.1111/j.1748-1090.1974.tb00801.x}, ' ...
'year = {1974}, ' ...
'title = {Notes on the growth of an {A}frican python: \emph{Python sebae}: and an {I}ndian python: \emph{Python molurus}: at the {C}annon {A}quarium and {V}ivarium, {M}anchester {M}useum}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {14}, ' ...
'pages = {140-141}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

