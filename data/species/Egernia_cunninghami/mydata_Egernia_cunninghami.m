function [data, auxData, metaData, txtData, weights] = mydata_Egernia_cunninghami

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Egernia_cunninghami';
metaData.species_en = 'Cunningham''s Skink';

metaData.ecoCode.climate = {'Cfb', 'Cfc', 'BWh', 'BWk', 'BSh', 'BSk'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'; 't-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney', 'Elia Pirtle'};
metaData.date_subm = [2017 01 06];
metaData.email    = {'mrke@unimelb.edu.au'};
metaData.address  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2017 01 06];


%% set data
% zero-variate data;
data.ab = 105;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'Chap2003';
  temp.ab = C2K(29.3202); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from 1990-1995 simulation at Weetangera';
data.ap = data.ab+1507; units.ap = 'd'; label.ap = 'age at puberty';        bibkey.ap = 'Barw1965';
  temp.ap = C2K(29.3202);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'based on average Tb analysis for Barwicks site, as per longevity analysis below';
data.am = 43*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Stow2004';
  temp.am = C2K(22.09023);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'rough from Harlow pers obs. cited in Stow 2004 - this animal is still going strong at 43 years old!';

data.Lb  = 6.92;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Kear2017';
data.Lp  = 19;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'Barw1965';
data.Li  = 24; units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Kear2017';

data.Wwb = 7.73;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Kear2017';
data.Wwp = 0.116467*data.Lp^2.531592;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Kear2017';
data.Wwi = 0.116467*data.Li^2.531592; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Kear2017';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Chap2003';
temp.Ri = C2K(22.09023); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
units.tL = {'d', 'cm'};  label.tL = {'age', 'SVL'};  bibkey.tL = 'Kear2017';
temp.tL = C2K(26.5414); units.temp.tL = 'K'; label.temp.tL = 'temperature';

data.LW = cat(2,tLW(:,2),tLW(:,3));
units.LW = {'cm', 'g'}; label.LW = {'SVL', 'wet weight'};  bibkey.LW = 'Kear2017';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
 weights.Wwb = weights.Wwb * 5;
% weights.Wwp = weights.Wwp * 20;
% weights.Wwi = weights.Wwi * 2;
 weights.Lb = weights.Lb * 5;
% weights.Lp = weights.Lp * 20;
% weights.Li = weights.Li * 2;
weights.Ri = weights.Ri * 2;
weights.tW = weights.tW * 5;
weights.LW = weights.LW * 5;
weights.tL = weights.tL * 5;
weights.TO = weights.TO * 1;
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
metaData.links.id_CoL = '6DXGC'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '794968'; % Ency of Life
metaData.links.id_Wiki = 'Egernia_cunninghami'; % Wikipedia
metaData.links.id_ADW = 'Egernia_cunninghami'; % ADW
metaData.links.id_Taxo = '91117'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Egernia&species=cunninghami'; % ReptileDB
metaData.links.id_AnAge = 'Egernia_cunninghami'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
    'howpublished = {\url{http://en.wikipedia.org/wiki/Egernia_cunninghami}}';   % replace my_pet by latin species name
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ALA'; type = 'Misc'; bib = ...
    'howpublished = {http://bie.ala.org.au/species/urn:lsid:biodiversity.org.au:afd.taxon:26a72559-86a3-4996-8f6d-9e0490e8f9f4}';
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
    'title = {Ecology, Life-History, and Behavior in the Australian Scincid Genus \emph{Egernia}, with Comments on the Evolution of Complex Sociality in Lizards}, ' ...
    'journal = {Herpetological Monographs}, ' ...
    'volume = {17}, ' ...
    'pages = {145-180}, ' ...
    'year = {2003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Barw1965'; type = 'PhDthesis'; bib = [ ...  %
    'author = {Barwick, R. E.}, ' ...
    'title = {Studies on the scincid lizard \emph{Egernia cunninghami} ({G}ray, 1832)}, ' ...
    'school = {Australian National University, Canberra}, ' ...
    'year = {1965}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Stow2004'; type = 'Article'; bib = [ ... 
    'author = {Stow, A. J. and Sunnucks, P.}, ' ...
    'title = {High mate and site fidelity in Cunningham''s skinks (\emph{Egernia cunninghami}) in natural and fragmented habitat}, ' ...
    'journal = {Molecular Ecology}, ' ...
    'volume = {13}, ' ...
    'pages = {419-430}, ' ...
    'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2017'; type = 'misc'; bib = [ ...  %
    'author = {Kearney, M. R and Aguilar, R. and Alton, L. and Bywater, C. and Pirtle, E. and White, C.}, ' ...
    'title = {Egernia life history paper}, ' ...
    'note = {Unpublished data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
