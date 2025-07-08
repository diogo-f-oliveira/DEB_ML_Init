function [data, auxData, metaData, txtData, weights] = mydata_Melanosuchus_niger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Melanosuchus_niger'; 
metaData.species_en = 'Black caiman'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 16];


%% set data
% zero-variate data

data.ab = 6*7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 70*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 250;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 250;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 340;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 610;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 144;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 100e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
data.Wwim = 1100e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 45/365/2.5;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '30-60, uptu 65, eggs per clutch, 1 clutch per 2-3 yrs';

% univariate data
% initial length-length after some period
LLt = [ ... % initial SVL (cm), SVL at recapture (cm), period (d)
 25.0  34.5 341
 26.0  34.5 362
 28.0  39.0 402
 29.5  37.5 403
 30.0  36.0 394
 31.5  39.5 411
 31.5  37.5 394 
 34.0  41.5 318
 34.0  44.5 405
 44.0  55.0 404
 47.5  54.0 406
 88.0  97.5 289
 91.0  97.0 281
 93.0 101.0 293
116.0 124.5 288
134.0 137.0 300];
data.LL = 2.382*LLt(:,1:2).^0.965; % convert SVL to TL
units.LL = {'cm', 'cm'};  label.LL = {'TL at capture', 'TL at recapture'};  
temp.LL  = C2K(23);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
time.LL = LLt(:,3); units.time.LL = 'd'; label.time.LL = 'time';
treat.LL = {0}; units.treat.LL = ''; label.treat.LL = '';
bibkey.LL = 'Herr1991';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 3 * weights.LL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-length: TL = 2.382 * SVL^0.965';
metaData.bibkey.F2 = 'Herr1991'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3ZBL4'; % Cat of Life
metaData.links.id_ITIS = '202215'; % ITIS
metaData.links.id_EoL = '1055872'; % Ency of Life
metaData.links.id_Wiki = 'Melanosuchus_niger'; % Wikipedia
metaData.links.id_ADW = 'Melanosuchus_niger'; % ADW
metaData.links.id_Taxo = '50622'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Melanosuchus&species=niger'; % ReptileDB
metaData.links.id_AnAge = 'Melanosuchus_niger'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melanosuchus_niger}}';
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
bibkey = 'Herr1991'; type = 'Article'; bib = [ ... 
'author = {Jon C. Herron}, ' ...
'year = {1991}, ' ...
'title  = {Growth Rates of Black Caiman \emph{Melanosuehus niger} and Spectacled Caiman \emph{Caiman crocodilus}, and the Recruitment, of Breeders in Hunted Caiman Populations}, ' ...
'journal = {Biological Conservation}, ' ...
'pages = {103-113}, ' ...
'volume = {55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

