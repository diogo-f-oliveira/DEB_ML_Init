function [data, auxData, metaData, txtData, weights] = mydata_Triturus_cristatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Triturus_cristatus'; 
metaData.species_en = 'Northern crested newt'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'L_t'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 01];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 01]; 

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'amphibiaweb';    
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 20 d';
data.tj = 2.75*30.5;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(12); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2.5 to 3 months';
data.tp = 600;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 28*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 5.44;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';    bibkey.Lp  = 'BuloKupf2019';
data.Li  = 10.8;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';      bibkey.Li  = 'wildpro';
  comment.Li = 'TL 18 cm, converted to SVL = TL * 0.6, based on photo';
data.Lim  = 8.4;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';      bibkey.Lim  = 'wildpro';
  comment.Li = 'TL 14 cm, converted to SVL = TL * 0.6, based on photo';

data.Wwb = 3.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'FurtIvan2008';
  comment.Wwb = 'estimated from 2.75 * (.6/10.4)^3'; 
data.Wwp = 1.35;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'BuloKupf2019','wildpro'};
  comment.Wwp = 'based on from (Lp/L_m)^3*Wwi';
data.Wwi = 10.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'wildpro';
  comment.Wwi = 'Since Li > L_im, the assumption is that the values for Wwi and Wwim were interchanged';
data.Wwim = 9.4;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';        bibkey.Wwim = 'wildpro';
  comment.Wwim = 'Since Li > L_im, the assumption is that the values for Wwi and Wwim were interchanged';

data.Ri  = 600/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '70-600 egg per clutch, 1 clutch per yr';

% univariate data
% initial length-length after 1 yr
data.LL_f = [ ... % SVL in 1999 (cm), SVL in 2000 (cm)
6.408	6.892
6.824	7.300
7.004	7.205
7.005	7.699
7.006	6.905
7.009	7.804
7.101	7.388
7.193	7.703
7.204	7.309
7.403	7.608
7.519	7.597
7.529	7.996
7.531	8.191
7.720	8.090
7.827	8.095
7.907	8.205
7.910	7.900
8.113	8.194
8.301	8.703
8.416	8.802];
units.LL_f  = {'cm', 'cm'};  label.LL_f = {'SVL in 1999', 'SVL in 2000', 'female'};  
temp.LL_f   = C2K(10);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'CummSwan2000';
comment.LL_f = 'Data for females';
%
data.LL_m = [ ... % % SVL in 1999 (cm), SVL in 2000 (cm)
5.901	6.413
6.206	6.780
6.400	7.186
6.405	6.911
6.405	6.887
6.506	7.220
6.506	7.186
6.531	6.993
6.601	7.095
6.604	7.201
6.633	7.003
6.691	7.090
6.698	7.293
6.708	6.994
6.713	7.491
6.816	7.298
6.817	7.206
6.832	7.394
6.835	7.404
6.906	7.414
6.911	7.298
6.914	7.419
7.021	7.298
7.114	7.409
7.208	7.690
7.307	7.492
7.405	7.487
7.420	7.598
7.624	7.801
7.815	8.009];
units.LL_m  = {'cm', 'cm'};  label.LL_m = {'SVL in 1999', 'SVL in 2000', 'male'};  
temp.LL_m   = C2K(10);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'CummSwan2000';
comment.LL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 5 * weights.LL_f;
weights.LL_m = 5 * weights.LL_m;

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '595F4'; % Cat of Life
metaData.links.id_ITIS = '668401'; % ITIS
metaData.links.id_EoL = '1018157'; % Ency of Life
metaData.links.id_Wiki = 'Triturus_cristatus'; % Wikipedia
metaData.links.id_ADW = 'Triturus_cristatus'; % ADW
metaData.links.id_Taxo = '47327'; % Taxonomicon
metaData.links.id_WoRMS = '1035197'; % WoRMS
metaData.links.id_amphweb = 'Triturus+cristatus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Triturus_cristatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triturus_cristatus}}';   
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
bibkey = 'CummSwan2000'; type = 'Article'; bib = [ ...  % 
'author = {Clive P. Cummins and Mary J. S. Swan}, ' ...
'title = {LONG-TERM SURVIVAL AND GROWTH OF FREE-LIVING GREAT CRESTED NEWTS (\emph{Triturus_cristatus}) PIT-TAGGED AT METAMORPHOSIS}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {10}, ' ...
'pages = {177- 182}, ' ...
'year = {2000}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BuloKupf2019'; type = 'Article'; bib = [ ...  % 
'author = {Bernd von B\"{u}low and Alexander Kupfer}, ' ...
'title = {Monitoring population dynamics and survival of Northern Crested Newts (\emph{Triturus cristatus}) for 19 years at a pond in Central {E}urope}, ' ...
'journal = {Salamandra}, ' ...
'volume = {55(2)}, ' ...
'pages = {97-102}, ' ...
'year = {2019}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FurtIvan2008'; type = 'Article'; bib = [ ...  % 
'author = {Milena Furtula and Ana Ivanovi\''{c} and Georg D\v{z}uki\''{c}1, and Milo\v{s} L. Kalezi\''{c}}, ' ...
'title = {Egg Size Variation in Crested Newts from the Western {B}alkans ({C}audata: {S}alamandridae: \emph{Triturus cristatus} Superspecies)}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {47(5)}, ' ...
'pages = {585-590}, ' ...
'year = {2008}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Triturus_cristatus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Triturus+cristatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wildpro'; type = 'Misc'; bib = ...
'howpublished = {\url{http://wildpro.twycrosszoo.org/S/0AmCaudata/Salamandridae/Triturus/Triturus_cristatus/Triturus_cristatus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
