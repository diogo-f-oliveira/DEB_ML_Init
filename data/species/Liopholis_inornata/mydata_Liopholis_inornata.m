function [data, auxData, metaData, txtData, weights] = mydata_Liopholis_inornata

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Liopholis_inornata';
metaData.species_en = 'Desert Skink';

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 't-L'; 't-Ww'; 'T-JO'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney', 'Elia Pirtle'};
metaData.date_subm = [2017 06 01];
metaData.email    = {'mrke@unimelb.edu.au'};
metaData.address  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2017 11 13];

%% set data
% zero-variate data;
data.ab = 4*30;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'Kear2017';
temp.ab = C2K(26.571); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'rough time between capture in field and birth in lab';
data.ap = data.ab+326; units.ap = 'd'; label.ap = 'age at puberty';        bibkey.ap = 'Kear2017';
temp.ap = C2K(26.571);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
comment.ap = 'mean time to 6 cm in lab';
data.am = 10*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Chap2003';
temp.am = C2K(23.67075);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'little data, Chap2003 says the members of the genus "may live for up to 10 years"';

data.Lb  = 4.2;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Kear2017';
data.Lp  = 6.;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Kear2017';
comment.Lp = 'length of smallest female gravid on capture 6.4 cm, #12';
data.Li  = 8.6; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Kear2017';

data.Wwb = 1.85;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kear2017';
data.Wwp = 0.04493326*data.Lp^2.865686;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Kear2017';
comment.Wwp = 'using length-weight relationship from Kear2017, calculated in growth_analysis_Liopholis_inornata.R';
data.Wwi = 0.04493326*data.Li^2.865686; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kear2017';
comment.Wwi = 'using length-weight relationship from KearUnpub, calculated in growth_analysis_Liopholis_inornata.R';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Pian1982';
temp.Ri = C2K(23.67075); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'max reported by Pian1982, assuming two clutches per year at most, temperature from NMR simulation';

% uni-variate data
OTW = csvread('OTW.csv');
data.TO = cat(2,OTW(:,2),OTW(:,1));
units.TO = {'C','mlO2/min'}; label.TO = {'temperature','O2 consumption rate'};  bibkey.TO = 'Kear2017';

tLW = csvread('tLW.csv');
tLW = sortrows(tLW,1);
data.tW = cat(2,tLW(:,1),tLW(:,3));
units.tW = {'d', 'g'};     label.tW = {'age', 'weight'};  bibkey.tW = 'KearUnpub';
temp.tW = C2K(26.9264); units.temp.tW = 'K'; label.temp.tW = 'temperature';

data.tL = cat(2,tLW(:,1),tLW(:,2));
units.tL = {'d', 'cm'};  label.tL = {'age', 'length'};  bibkey.tL = 'Kear2017';
temp.tL = C2K(26.5414); units.temp.tL = 'K'; label.temp.tL = 'temperature';

data.LW = cat(2,tLW(:,2),tLW(:,3));
units.LW = {'cm', 'g'}; label.LW = {'snout vent length', 'wet weight'};  bibkey.LW = 'Kear2017';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
%weights.Wwb = weights.Wwb * 20;

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
D1 = 'The T_A is estimated outside of this fitting procedure in a general study of Egernia-group lizards';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3V7BW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '794963'; % Ency of Life
metaData.links.id_Wiki = 'Liopholis_inornata'; % Wikipedia
metaData.links.id_ADW = 'Egernia_inornata'; % ADW
metaData.links.id_Taxo = '1685439'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Liopholis&species=inornata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Liopholis}}';   
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
bibkey = 'Chap2003'; type = 'Article'; bib = [ ...  %
    'author = {Chapple, D. G.}, ' ...
    'title = {Ecology, Life-History, and Behavior in the {A}ustralian Scincid Genus \emph{Egernia}, with Comments on the Evolution of Complex Sociality in Lizards}, ' ...
    'journal = {Herpetological Monographs}, ' ...
    'volume = {17}, ' ...
    'pages = {145-180}, ' ...
    'year = {2003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pian1982'; type = 'Article'; bib = [ ... 
    'author = {Pianka, E. R. and Giles, W. F}, ' ...
    'title = {Notes on the biology of two species of nocturnal skinks, \emph{Egernia inornata} and \emph{Egernia striata}, in the {G}reat {V}ictorian {D}esert}, ' ...
    'journal = {Western Australian Naturalist}, ' ...
    'volume = {15}, ' ...
    'pages = {8-13}, ' ...
    'year = {1982}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2017'; type = 'Misc'; bib = [ ...  
    'author = {Kearney, M. R. and Aguilar, R. and Alton, L. and Bywater, C. and Pirtle, E. and White, C.}, ' ...
    'title = {Egernia life history paper}, ' ...
    'note = {in prep}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
