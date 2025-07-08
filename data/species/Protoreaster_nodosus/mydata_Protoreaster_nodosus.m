function [data, auxData, metaData, txtData, weights] = mydata_Protoreaster_nodosus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Oreasteridae';
metaData.species    = 'Protoreaster_nodosus'; 
metaData.species_en = 'Horned sea star'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP', 'MI'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCia', 'bjCis'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 25]; 


%% set data
% zero-variate data

data.tp = 2.5*365; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'BosGuma2008';
  temp.tp = C2K(29); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';     label.am = 'life span';               bibkey.am = 'BosGuma2008';   
  temp.am = C2K(29); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 8.18e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'ScheMeta2008';
  comment.Wwb = 'based on egg diameter of 0.250 mm: pi/6*0.025^3';
data.Wwj  = 5.04e-4; units.Wwj  = 'g';  label.Wwj  = 'wet weight at metam';     bibkey.Wwj  = 'guess';
  comment.Wwj = 'based on 0.0028*(10*Lj)^2.4743 for guessed Lj = 0.5 mm, see F2';
data.Wwp  = 143; units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'BosGuma2008';
  comment.Wwp = 'based on 0.0028*(10*Lp)^2.4743 for Lp = 8 cm, see F2';
data.Wwi  = 678; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';      bibkey.Wwi  = 'BosGuma2008';
  comment.Wwi = 'based on 0.0028*(10*Li)^2.4743 for Li = 15 cm, see F2';

data.GSI  = 0.045; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'BosGuma2008';   
  temp.GSI = C2K(29);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data

% growth in length
LdL = [... % radius (cm), growth in radius (cm/d) 
3.191	2.963
3.849	3.127
4.323	2.612
4.754	2.127
5.313	1.776
5.756	1.843
6.244	1.381
6.774	1.276
7.146	1.246
7.690	1.045];
LdL(:,2) = LdL(:,2)/ 365; % convert yr to d
LR = LdL(:,1); LV = (0.8346 * LR .^ 2.4743) .^ (1/3); % cm, volumetric length
% LV = (a*LR^b)^(1/3); d/dt LV = dLR * (b/ 3) * (LV/ LR)
dLV = LdL(:,2) * 2.4743/3 .* (LV ./ LR); % chang in volumetric length
data.LdL = [LV, dLV];
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'volumetric length', 'change in volumetric length'};  
temp.LdL   = C2K(29);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'BosGuma2008';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of changes in shape during growth, radius length is converted to volumetric length';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'weight-length: weight (g): W = 0.0028 * (radius in mm) ^2.4743 = 0.8346 * (radius in cm) ^2.4743';
metaData.bibkey.F2 = 'BosGuma2008'; 
metaData.facts = struct('F1',F1,'F2',F2);  

%% Links
metaData.links.id_CoL = '4N6V8'; % Cat of Life
metaData.links.id_ITIS = '990852'; % ITIS
metaData.links.id_EoL = '45328867'; % Ency of Life
metaData.links.id_Wiki = 'Protoreaster_nodosus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3908165'; % Taxonomicon
metaData.links.id_WoRMS = '213285'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Protoreaster_nodosus}}';
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
bibkey = 'BosGuma2008'; type = 'Article'; bib = [ ... 
'author = {A. R. Bos and G. S. Gumanao  and J. C. E. Alipoyo and L. T. Cardona}, ' ... 
'year = {2008}, ' ...
'title = {Population dynamics, reproduction and growth of the {I}ndo-{P}acific horned sea star, \emph{Protoreaster nodosus} ({E}chinodermata: {A}steroidea)}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {156}, ' ...
'pages = {55-63}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScheMeta2008'; type = 'Article'; bib = [ ... 
'author = {R. E. Scheibling and A. Metaxas}, ' ... 
'year = {2008}, ' ...
'title = {Abundance, spatial distribution, and size structure of the sea star \emph{Protoreaster nodosus} in {P}alau, with notes on feeding and reproduction}, ' ...
'journal = {Bull Mar Sci}, ' ...
'volume = {82}, ' ...
'pages = {221--235}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Protoreaster-nodosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];