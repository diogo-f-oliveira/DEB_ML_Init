function [data, auxData, metaData, txtData, weights] = mydata_Gobius_paganellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobius_paganellus'; 
metaData.species_en = 'Rock goby';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 23];


%% set data
% zero-variate data

data.tp = 912;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Lim  = 13;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length';     bibkey.Lim  = 'fishbase';

data.Wwb = 0.0011; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg length of 2.5 mm and width of 0.9 mm (guessed): pi/6*0.25*0.09^2';
data.Wwp = 2.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'from L-W relationship at Lp, see F1';
data.Wwi = 24.4;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'from L-W relationship at Li, see F1';

data.Ri  = 8978/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... %  age (yr), total length (cm)
0.43 3.4
0.55 4.7
0.63 6
0.73 6.7
0.85 7.7
1.05 7.7
1.13 7.8
1.19 8.4
1.51 8
1.42 8.8
1.52 9.6
1.62 10
1.73 10.1
1.82 10.6
1.88 10.6];
data.tL(:,1) = 365 * data.tL(:,1); 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AzevSima2000';
comment.tL = 'Data from Azores';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0;
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Weight-length: Ww in g = 0.01110 *	(TL in cm)^3';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GQ39'; % Cat of Life
metaData.links.id_ITIS = '171854'; % ITIS
metaData.links.id_EoL = '46575234'; % Ency of Life
metaData.links.id_Wiki = 'Gobius_paganellus'; % Wikipedia
metaData.links.id_ADW = 'Gobius_paganellus'; % ADW
metaData.links.id_Taxo = '46587'; % Taxonomicon
metaData.links.id_WoRMS = '126893'; % WoRMS
metaData.links.id_fishbase = 'Gobius-paganellus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobius_paganellus}}';
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
bibkey = 'AzevSima2000'; type = 'Article'; bib = [ ... 
'author = {J. M. N. Azevedo and A. M. V. Simas}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth, reproduction and diet of a sublittoral population of the rock goby \emph{Gobius paganellus} ({T}eleostei, {G}obiidae)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {440}, ' ...
'pages = {129-135}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/73}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gobius_paganellus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
