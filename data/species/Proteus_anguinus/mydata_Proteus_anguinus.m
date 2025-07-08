function [data, auxData, metaData, txtData, weights] = mydata_Proteus_anguinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Proteidae';
metaData.species    = 'Proteus_anguinus'; 
metaData.species_en = 'Olm'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFcc'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aR'; 'am'; 'Lb'; 'LR'; 'Li'; 'Wwb'; 'WwR'; 'Wwi'; 'Ri'; 'JO_W'}; 
metaData.data_1     = {'T-ab'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 14];


%% set data
% zero-variate data

data.tR = 4124;   units.tR = 'd';    label.tR = 'time since birth at first brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(10);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 102*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = {'VoitFrai2011', 'AnAge'};   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wiki'; 
data.LR  = 10;     units.LR  = 'cm';  label.LR  = 'total length at 1st brood';  bibkey.LR  = 'guess'; 
  comment.LR = 'guess based on same relative length, compared to Lissotriton vulgaris';
data.Li = 30;      units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li  = 'VoitFrai2011';

data.Wwb = 0.0477; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on freshly-laid egg diameter 4.5 mm (swells to 8.5 mm): pi/6*0.45^3';
data.WwR = 0.74;  units.WwR = 'g';   label.WwR = 'wet weight at 1st brood';    bibkey.WwR = 'guess';
  comment.WwR = 'computed from W_m*(L_p/L_m)^3';
data.Wwi = 20;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'VoitFrai2011', 'AnAge'};
  comment.Wwi = '15-20 g';

data.Ri  = 35/(12.5*365);  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'VoitFrai2011';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JO  = 0.29;    units.JO  = 'ml/h'; label.JO  = 'O_2 consumption at 7.75 g'; bibkey.JO  = 'VoitFrai2011';   
  temp.JO = C2K(25);  units.temp.JO = 'K'; label.temp.JO = 'temperature';

% uni-variate data

% temperature-incubation data 
data.Tab = [ ... % temperature (C), age at birth (d)
 8 183
10 140
11 123
15  86];
units.Tab  = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'amphibiaweb';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

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
D1 = 'VoitFrai2011 found longevity extreme, but this cannot be confirmed from this analysis; both spec som maintenance and aging acceleration are smallish, but not extreme';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Lacks pigmentation and has tiny skin-covered eyes, but subspecies P. a. parkelj is black, has functional eyes and max length over 40 cm';
metaData.bibkey.F1 = 'Spar2014'; 
F2 = 'Males are a little shorter than females';
metaData.bibkey.F2 = 'Spar2014'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4N3XG'; % Cat of Life
metaData.links.id_ITIS = '208253'; % ITIS
metaData.links.id_EoL = '331216'; % Ency of Life
metaData.links.id_Wiki = 'Proteus_anguinus'; % Wikipedia
metaData.links.id_ADW = 'Proteus_anguinus'; % ADW
metaData.links.id_Taxo = '47271'; % Taxonomicon
metaData.links.id_WoRMS = '1382163'; % WoRMS
metaData.links.id_amphweb = 'Proteus+anguinus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Proteus_anguinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Proteus_anguinus}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ... 
'author = {M. Sparreboom}, ' ... 
'year = {2014}, ' ...
'title = {Salamanders of the Old World}, ' ...
'publisher = {KNNV}, ' ...
'address = {Untrecht}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VoitFrai2011'; type = 'Article'; bib = [ ... 
'author = {Y. Voituron and M. de Fraipont and J. Issartel and O. Guillaume and J. Clobert}, ' ... 
'year = {2011}, ' ...
'title = {Extreme lifespan of the human fish (\emph{Proteus anguinus}): a challenge for ageing mechanisms}, ' ...
'doi = {10.1098/rsbl.2010.0539}, ' ...
'journal = {Biol. Lett.}, ' ...
'volume = {7}, ' ...
'pages = {105-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/18377/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.amphibiaweb.org/cgi/amphib_query?where-genus=Proteus&where-species=anguinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Proteus_anguinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

