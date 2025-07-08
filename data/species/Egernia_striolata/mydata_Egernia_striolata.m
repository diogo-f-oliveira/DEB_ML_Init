function [data, auxData, metaData, txtData, weights] = mydata_Egernia_striolata

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Egernia_striolata';
metaData.species_en = 'Tree Skink';

metaData.ecoCode.climate = {'Cfb', 'Cfc', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 't-L'; 't-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney', 'Elia Pirtle'};
metaData.date_subm = [2017 06 01];
metaData.email    = {'mrke@unimelb.edu.au'};
metaData.address  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2017 06 01];


%% set data
% zero-variate data;
data.ab = 30*3;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = {'Kear2017'};
temp.ab = C2K(29.27777); units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'longest time after a female was brought in that she had her babies';
data.ap = data.ab+743.1; units.ap = 'd'; label.ap = 'age at puberty';        bibkey.ap = 'Kear2017';
temp.ap = C2K(29.27777);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
comment.ap = 'based on mean time to 10.4 mm in lab';
data.am = 25*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Chap2003';
temp.am = C2K(22.18982);  units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'no data - used E. stokesii value from Chap2003 Table 2';


data.Lb  = 5.1726;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Kear2017';
data.Lp  = 10;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Bull2004';
comment.Lp = 'Bull2004 gives 10.4 as smallest mature female - assume a little smaller because maturity happens well before parturition';
data.Li  = 12.1; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Kear2017';

data.Wwb = 3.028;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kear2017';
data.Wwp = 0.03770498*data.Lp^2.854377;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Kear2017';
data.Wwi = 0.03770498*data.Li^2.854377; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kear2017';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Bull2004';
temp.Ri = C2K(22.18982); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'max litter size from Bull2004 - up to 7 recorded by Pete Comber though, cited in Fyfe2008';

% uni-variate data
OTW = csvread('OTW.csv');
data.TO = cat(2,OTW(:,2),OTW(:,1));
units.TO = {'C','mlO2/min'}; label.TO = {'temperature','O2 consumption rate'};  bibkey.TO = 'Kear2017';

tLW = csvread('tLW.csv');
tLW = sortrows(tLW,1);
data.tW = cat(2,tLW(:,1),tLW(:,3));
units.tW = {'d', 'g'};     label.tW = {'age', 'weight'};  bibkey.tW = 'Kear2017';
temp.tW = C2K(26.9264); units.temp.tW = 'K'; label.temp.tW = 'temperature';

data.tL = cat(2,tLW(:,1),tLW(:,2));
units.tL = {'d', 'cm'};  label.tL = {'age', 'length'};  bibkey.tL = 'Kear2017';
temp.tL = C2K(26.5414); units.temp.tL = 'K'; label.temp.tL = 'temperature';

data.LW = cat(2,tLW(:,2),tLW(:,3));
units.LW = {'cm', 'g'}; label.LW = {'snout vent length', 'wet weight'};  bibkey.LW = 'Kear2017';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
% weights.Wwb = weights.Wwb * 20;
% weights.Wwi = weights.Wwi * 20;
% weights.Lb = weights.Lb * 20;
% weights.Li = weights.Li * 20;
% weights.Ri = weights.Ri * 20;
% weights.tW = weights.LW * 20;
weights.tW = weights.tW * 20;
% weights.tL = weights.tL * 20;
% weights.TO = weights.TO * 20;
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The T_A is estimated outside of this fitting procedure in a general study of Egernia-group lizards';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6DWYD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '794945'; % Ency of Life
metaData.links.id_Wiki = 'Egernia_striolata'; % Wikipedia
metaData.links.id_ADW = 'Egernia_striolata'; % ADW
metaData.links.id_Taxo = '91138'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Egernia&species=striolata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Egernia_striolata}}';   % replace my_pet by latin species name
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
bibkey = 'Bull2004'; type = 'Article'; bib = [ ... 
    'author = {Bull, C. M. & Bonnett, M.}, ' ...
    'title = {\emph{Egernia striolata} (tree skink) reproduction}, ' ...
    'journal = {Herpetological Review}, ' ...
    'pages = {389}, ' ...
    'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fyfe2008'; type = 'Incollection'; bib = [ ... % meant as example; replace this and further bib entries
    'author = {Fyfe, G.}, ' ...
    'title = {Skinks Family Scincidae}, ' ...
    'booktitle = {Keeping and Breeding Australian Lizards}, ' ...
    'editor = {Swan, M.}, ' ...
    'publisher = {Mike Swan Herp. Books, Lilydale Victoria}, ' ...
    'pages = {259-388}, ' ...
    'year = {2008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2017'; type = 'Misc'; bib = [ ...  
    'author = {Kearney, M. R. and Aguilar, R. and Alton, L. and Bywater, C. and Pirtle, E. and White, C.}, ' ...
    'title = {Egernia life history paper}, ' ...
    'year = {2017}, ' ...
    'note = {in prep}'];
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
