function [data, auxData, metaData, txtData, weights] = mydata_Neoceratodus_forsteri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Sarcopterygii'; 
metaData.order      = 'Ceratodontiformes'; 
metaData.family     = 'Ceratodontidae';
metaData.species    = 'Neoceratodus_forsteri'; 
metaData.species_en = 'Australian lungfish'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'L_t'; 'Lp'; 'Li'; 'Wdb'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-JOe_T'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 06 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 05 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 10];


%% set data
% zero-variate data

data.ab_15 = 56;     units.ab_15 = 'd';    label.ab_15 = 'age at birth at 15 C';  bibkey.ab_15 = 'MuelJoss2011';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_20 = 29;     units.ab_20 = 'd';    label.ab_20 = 'age at birth at 20 C';  bibkey.ab_20 = 'MuelJoss2011';   
  temp.ab_20 = C2K(20);  units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
  comment.ab_20 = '24.5 d AlleMidg2002';
data.ab_25 = 16;     units.ab_25 = 'd';    label.ab_25 = 'age at birth at 25 C';  bibkey.ab_25 = 'MuelJoss2011';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.ap = 22 * 365;  units.ap = 'd';       label.ap = 'age at puberty for female'; bibkey.ap = 'BrooKind2002';
  temp.ap = C2K(20);     units.temp.ap = 'K';    label.temp.ap = 'temperature';
data.apm = 17 * 365; units.apm = 'd';      label.apm = 'age at puberty for male'; bibkey.apm = 'BrooKind2002';
  temp.apm = C2K(20);    units.temp.apm = 'K';   label.temp.apm = 'temperature';
data.am = 80 * 365;  units.am = 'd';       label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20);     units.temp.am = 'K';    label.temp.am = 'temperature'; 
  comment.am = 'Shedd Aquarium in Chicago, named "Granddad", has been there since 1933 and is at least 80 years old.';

%data.L0  = 0.3;      units.L0  = 'cm';     label.Lb  = 'egg diameter';            bibkey.L0  = 'Kemp1982';  
%  comment.L0 = '1 cm including jelly';
data.L110 = 2.7;     units.L110  = 'cm';   label.L110  = 'total length at 110 d'; bibkey.L110  = 'MerrSchm1984';  
  temp.L110 = C2K(20); units.temp.L110 = 'K';    label.temp.L110 = 'temperature'; 
data.L240 = 6;       units.L240  = 'cm';   label.L240  = 'total length at 240 d'; bibkey.L240  = 'MerrSchm1984';  
  temp.L240 = C2K(20); units.temp.L240 = 'K';    label.temp.L240 = 'temperature'; 
data.Lp  = 83.5;     units.Lp  = 'cm';     label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'BrooKind2002'; 
data.Lpm = 77;       units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'BrooKind2002'; 
data.Li  = 150;      units.Li  = 'cm';     label.Li  = 'ultimate total length';   bibkey.Li  = 'WhitPoll1960';

data.Wdb = 0.00165;  units.Wdb = 'g';      label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'MuelJoss2011';
  comment.Wdb = 'gut-free dry weight at hatching';
data.Wwb = 0.00839;  units.Wwb = 'g';      label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MuelJoss2011';
  comment.Wwb = 'gut-free wet weight at hatching';
data.Wwi = 43000;    units.Wwi = 'g';      label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WhitPoll1960';

data.Ri  = 600/365;  units.Ri  = '#/d';    label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'PuseKenn2004';   
  temp.Ri = C2K(20); units.temp.Ri = 'K';    label.temp.Ri = 'temperature';
 
% uni-variate data

data.aJO_25 = [... % age (d), J_O (nmol/h)
3.050 9.346
7.064 8.827
10.115 26.827
11.881 32.019
16.376 34.442];
units.aJO_25  = {'d', 'nmol/h'};  label.aJO_25 = {'age', 'O2 consumption', '25 C'};  
temp.aJO_25   = C2K(25);  units.temp.aJO_25 = 'K'; label.temp.aJO_25 = 'temperature';
bibkey.aJO_25 = 'MuelJoss2011';

data.aJO_20 = [... % age (d), J_O (nmol/h)
4.014 5.192
8.028 7.788
10.917 4.154
17.982 18.519
22.156 25.442
30.183 34.788];
units.aJO_20  = {'d', 'nmol/h'};  label.aJO_20 = {'age', 'O2 consumption', '20 C'};  
temp.aJO_20   = C2K(20);  units.temp.aJO_20 = 'K'; label.temp.aJO_20 = 'temperature';
bibkey.aJO_20 = 'MuelJoss2011';

data.aJO_15 = [... % age (d), J_O (nmol/h)
6.101 4.154
8.991 9.519
13.968 5.538
16.858 5.365
20.872 5.885
24.243 5.365
29.220 9.519
31.950 8.827
35.161 9.000
36.927 7.096
38.853 10.558
43.188 14.365
48.005 13.327
55.069 18.173
59.083 18.173
70.000 16.442];
units.aJO_15  = {'d', 'nmol/h'};  label.aJO_15 = {'age', 'O2 consumption', '15 C'};  
temp.aJO_15   = C2K(15);  units.temp.aJO_15 = 'K'; label.temp.aJO_15 = 'temperature';
bibkey.aJO_15 = 'MuelJoss2011';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'aJO_25','aJO_20','aJO_15'}; subtitle1 = {'MuelJass2011 data at 25, 20, 15 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = ['The female has a large ovary and the potential to lay many eggs, but in the wild only produces a few hundreds of eggs, at most, during her lifetime. '...
      'In captivity, anywhere from 200 to 500-600 eggs have been laid in a single event. '...
      'The lungfish does not necessarily spawn every year. '...
      'A good spawning season occurs approximately once every five years, regardless of environmental conditions.'];
metaData.bibkey.F1 = 'PuseKenn2004'; 
F2 = ['During the first week it lies on its side, hiding in the weeds and moving only when stimulated by touch. ' ...
      'It will swim spontaneously, and often retreat back into the gelatinous envelope when disturbed. '...
      'Newly hatched larvae develop a ciliary current over the skin and gill surfaces. ' ...
      'Larvae are reported not to feed for 2-3 weeks while the yolk is still present. ' ... 
      '(But MuelJoss2011 give 0.0452 g gut-free wet weigth at yolk absorption and 0.00893 at hatch). '...
      'By the time the yolk is fully utilized, a spiral valve has developed in the intestine and the fish starts to feed. ' ...
      'The young can be fast growing, and can grow about 2 inches per month under optimal conditions.'];
metaData.bibkey.F2 = 'WhitBone1980'; 
F3 = ['The lungfish is tolerant of cold, but prefers waters with temperatures between 15-25 C. '  ...
      'Both sexes follow similar growth patterns, although the females grow to a slightly larger size.'];
metaData.bibkey.F3 = 'PuseKenn2004'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6S8FM'; % Cat of Life
metaData.links.id_ITIS = '161037'; % ITIS
metaData.links.id_EoL = '339109'; % Ency of Life
metaData.links.id_Wiki = 'Neoceratodus_forsteri'; % Wikipedia
metaData.links.id_ADW = 'Neoceratodus_forsteri'; % ADW
metaData.links.id_Taxo = '42340'; % Taxonomicon
metaData.links.id_WoRMS = '1421405'; % WoRMS
metaData.links.id_fishbase = 'Neoceratodus-forsteri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neoceratodus_forsteri}}';
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
bibkey = 'MuelJoss2011'; type = 'Article'; bib = [ ... 
'author = {Mueller, C. A. and Joss, J. M. P. and Seymour, R. S.}, ' ... 
'year = {2011}, ' ...
'title = {The energy cost of embryonic development in fishes and amphibians, with emphasis on new data from the {A}ustralian lungfish, \emph{Neoceratodus forsteri}}, ' ...
'journal = {J. Comp. Physiol. B}, ' ...
'volume = {181}, ' ...
'pages = {43-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrooKind2002'; type = 'Techreport'; bib = [ ... 
'author = {Brooks, S. G. and Kind, P. K.}, ' ... 
'year = {2002}, ' ...
'title = {Ecology and demography of the {Q}ueensland lungfish (\emph{Neoceratodus forsteri}) in the {B}urnett {R}iver, {Q}ueensland with reference to the impacts of {W}alla {W}eir and future water infrastructure development}, ' ...
'institution = {Queensland Department of Primary Industries, Brisbane}, ' ...
'number = {QO02004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PuseKenn2004'; type = 'Book'; bib = [ ... 
'author = {Pusey, B. and Kennard, M. and Arthington, A.}, ' ... 
'year = {2004}, ' ...
'title = {Freshwater Fishes of North-Eastern Australia.}, ' ...
'publisher = {CSIRO Publishing}, ' ...
'address = {Nathan, QLD}, ' ...
'pages = {49--59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlleMidg2002'; type = 'book'; bib = [ ... 
'author = {Allen, G. R. and Midgley, S. H. and Allen, M.}, ' ... 
'year = {2002}, ' ...
'title = {Field Guide to the Freshwater Fishes of {A}ustralia.}, ' ...
'publisher = {Western Australia Museum}, ' ...
'address = {Perth, W.A.}, '...
'pages = {54--55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MerrSchm1984'; type = 'Book'; bib = [ ... 
'author = {Merrick, J. R. and Schmida, G. E.}, ' ... 
'year = {1984}, ' ...
'title = {Australian Freshwater Fishes Biology and Management.}, ' ...
'publisher = {Griffin Press}, ' ...
'address = {Sydney}, ' ...
'isbn = {0 9591908 0 5}, '...
'pages = {46--51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitBone1980'; type = 'Article'; bib = [ ... 
'author = {Whiting, H. P. and Bone, Q.}, ' ... 
'year = {1980}, ' ...
'title = {Ciliary cells in the epidermis of the larval {A}ustralian dipnoan, \emph{Neoceratodus}}, ' ...
'journal = {Zoological Journal of the Linnean Society}, ' ...
'volume = {68}, ' ...
'pages = {125--137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WhitPoll1960'; type = 'book'; bib = [ ... 
'author = {Whitley, G. P. and Jack Pollard, J.}, ' ... 
'year = {1960}, ' ...
'title = {G. P. Whitley''s Handbook of Australian Fishes}, ' ...
'publisher = {Wilke and Company Ltd.}, ' ...
'address = {Victoria}, ' ...
'pages = {334}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

