function [data, auxData, metaData, txtData, weights] = mydata_Brachionus_plicatilis 
%% set metadata

metaData.phylum     = 'Rotifera'; 
metaData.class      = 'Monogononta'; 
metaData.order      = 'Ploimida'; 
metaData.family     = 'Brachionidae';
metaData.species    = 'Brachionus_plicatilis'; 
metaData.species_en = 'Rotifer'; 
metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TN', 'TP'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};
metaData.T_typical  = C2K(20); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'JCi'; 'JXi'; 'K'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2011 10 11];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};

metaData.author_mod_1  = {'Dina Lika'};
metaData.date_mod_1    = [2015 05 22];
metaData.email_mod_1   = {'lika@biology.uoc.gr'};
metaData.address_mod_1 = {'University of Crete Heraklion, GR-70013, Greece'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 14]; 



%% set data

data.ab = 1.0;     units.ab = 'd';        label.ab = 'age at birth';            bibkey.ab = 'AlveAlfr2006';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1.9;     units.ap = 'd';        label.ap = 'age at puberty';          bibkey.ap = 'AlveAlfr2006';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 11;      units.am = 'd';        label.am = 'life span';               bibkey.am = 'AlveAlfr2006';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3.8e-7; units.Wwb = 'g';       label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AlveAlfr2006';
data.Wwp = 2.2e-6; units.Wwp = 'g';       label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'AlveAlfr2006';
data.Wwi = 2.8e-6; units.Wwi = 'g';       label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'AlveAlfr2006';

data.Ri  = 24/5.3; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AlveAlfr2006';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.JCi = 40;     units.JCi  = 'ng C/d'; label.JCi  = 'CO2 flux';              bibkey.JCi  = 'AlveAlfr2006';    
  temp.JCi = C2K(25); units.temp.JCi = 'K'; label.temp.JCi = 'temperature';
  
data.JXi = 0.72;   units.JXi = 'mug/d';   label.JXi = 'dry Nannochloropsis oculata'; bibkey.JXi = 'AlveAlfr2006'; 
  temp.JXi = C2K(25); units.temp.JXi = 'K'; label.temp.JXi = 'temperature';
  comment.JXi = '148 cells N.c./min per rotifer';

data.K = 4.8e-3;   units.K = 'g/l';       label.K = ' half saturation coefficient';  bibkey.K = 'AlveAlfr2006';
  comment.K = 'for Isochrysis galbana on dry mass basis';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = weights.psd.p_M;
weights.psd.kap = weights.psd.kap*5;
weights.psd.v = weights.psd.v*5;

%% Facts
F1 = 'Rotifers have a fixed number of cells (some 1000), which does not increase after birth.';
metaData.bibkey.F1    = 'Wiki_Roti';
metaData.facts = struct('F1',F1);

%% Discussion points
D1 = 'no growth after 2 d at 25 C';
D2 = ' no reproduction after 9.5 d at 20 C';     
D3 = 'CO2 production includes assimilation contributions';
D4 = 'Growth is mostly by (fast) uptake of water, meaning that p_M is unrealistically high';
D5 = 'weights of several pseudodata points were decreased';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3,'D4',D4,'D5',D5);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'MTQW'; % Cat of Life
metaData.links.id_ITIS = '58435'; % ITIS
metaData.links.id_EoL = '1062516'; % Ency of Life
metaData.links.id_Wiki = 'Brachionus_plicatilis'; % Wikipedia
metaData.links.id_ADW = 'Brachionus_plicatilis'; % ADW
metaData.links.id_Taxo = '91556'; % Taxonomicon
metaData.links.id_WoRMS = '134982'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Brachionus_plicatilis}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_Roti'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rotifera}}';   % replace my_pet by latin species name
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
bibkey = 'AlveAlfr2006'; type = 'Article'; bib = [ ... 
'author = {Alver, M. O. and Alfredsen, J. A. and Olsen, Y.}, ' ... 
'year = {2006}, ' ...
'title = {An individual-based population model for rotifer (\emph{Brachionus plicatilis}) cultures}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {560}, ' ...
'pages = {93-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

