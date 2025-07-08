function [data, auxData, metaData, txtData, weights] = mydata_Ferosagitta_hispida

%% set metaData
metaData.phylum     = 'Chaetognatha';
metaData.class      = 'Sagittoidea'; 
metaData.order      = 'Aphragmophora'; 
metaData.family     = 'Sagittidae';
metaData.species    = 'Ferosagitta_hispida'; 
metaData.species_en = 'Arrow worm'; 
metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ri'; 'JX_L'}; 
metaData.data_1     = {'t-L'; 't-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 11 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 11 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 07]; 

%% set data
% zero-variate data

data.ah = 36/24;   units.ah = 'd';    label.ah = 'age at hatch';             bibkey.ah = 'Pear1991';   
  temp.ah = C2K(21);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 3;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Pear1991';   
  temp.ab = C2K(21);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 15;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.09;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';   bibkey.Lh  = 'Pear1991';
data.Lb  = 0.13;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Pear1991';
data.Lp  = 0.76;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Reev1970';
  comment.Lp = '50% puberty at 0.52, 0.68 0.76 cm (testis, Reev70)';
data.Li  = 1.2;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Beer1964';

data.Ri  = 68/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Pear1991';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'spawning each other day';

data.JX85  = 0.64; units.JX85  = 'mg dry weight/d'; label.JX85  = 'ingestion rate at 0.85 cm';     bibkey.JX85  = 'Reev1964';   
  temp.JX85 = C2K(24);  units.temp.JX85 = 'K'; label.temp.JX85 = 'temperature';

% uni-variate data

% t-L data
data.tL = [ ... % time (d), length (mm)
      0           5.719013351;
      1.004807287 6.010528212;
      2.031824078 6.718443345;
      4.932518592 7.620700847;
      6.046838004 7.782382101;
      6.968845857 7.703429288;
      7.882064101 7.649146837;
      8.879077857 8.032791348;
      11.964085   8.787267799;
      13.00405214 8.7809448;
      13.96929759 8.985142746;
      14.99656008 8.628248592;
      15.98963038 8.987199407;
      19.04748299 9.183711874;
      21.02577343 9.152776195;
      21.94241357 9.165976366;
      22.88083716 9.133135047];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Reev1970';
comment.tL = 'see Kooy2010 {82}, Fig 3.1';

% t-W data
data.tW= [ ... % time (d), ash-free dry weight^1/3 (mg^1/3)
     3.47707485 0.0553129379;
     4.46197129 0.07837960975;
     6.378210501 0.1027437603;
     6.820092905 0.06966511478;
     8.520665908 0.1189467224;
     9.382378517 0.09274625457;
     11.47111506 0.09992616986;
     10.43148813 0.1458886958;
     12.14297122 0.1841428373;
     13.26882083 0.1315932055;
     13.35945815 0.1997644458;
     15.34644866 0.1651246056;
     16.40677463 0.1836090847;
     14.63993923 0.2623612087;
     15.26424342 0.2771180948;
     18.86608357 0.2598220986;
     18.74162082 0.309230182;
     20.67480151 0.2725848362;
     21.71876699 0.3072524766;
     22.27233287 0.3800108475;
     23.02021997 0.4132436208;
     22.11547583 0.436579391;
     19.09030808 0.4053307424;
     17.53981453 0.4070351029;
     16.13988677 0.422203068;
     18.4597906 0.454590969;
     21.31792442 0.4968656517;
     19.56826252 0.4967063886;
     18.6096733 0.5207577407;
     22.92187883 0.5240912408;
     25.13870388 0.6174878481;
     25.17588221 0.6565859237;
     20.29292245 0.6605511609;
     29.28905487 0.6476010959;
     22.45613816 0.7364750288;
     23.9635612 0.7349134884;
     26.01414862 0.77789684;
     28.29681658 0.7756263344];
data.tW(:,2) = data.tW(:,2).^3; % convert mg^(1/3) to mg
units.tW   = {'d', 'mg'};  label.tW = {'time since birth', 'dry weight'};  
temp.tW    = C2K(21);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Reev1970';
comment.tW = 'see Kooy2010 {82}, Fig 3.1';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 0.1 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'length-wet weight relationship: morphology suggests length : width : height = 1 : 0.1 : 0.02';
D2 = 'so V = .002 L^3, probably an over-estimation';
D3 = 'Ww_i = .002 1.2^3 = 8.6 mg; Wd_i = 0.1 mg';
D4 = 'shape of tW-curve strongly suggests that gonads contribute to Wd';
D5 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4, 'D5', D5);

%% Facts
F1 = 'protandrous hermaphrodite (testes mature before ovaries); internal fertilisation';
metaData.bibkey.F1 = 'Pear1991'; 
F2 = 'protandrous hermaphrodite (testes mature before ovaries); internal fertilisation';
metaData.bibkey.F2 = 'Pear1991'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6HQL8'; % Cat of Life
metaData.links.id_ITIS = '158764'; % ITIS
metaData.links.id_EoL = '512014'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Ferosagitta_hispida'; % ADW
metaData.links.id_Taxo = '114772'; % Taxonomicon
metaData.links.id_WoRMS = '105432'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetognatha}}';
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
bibkey = 'Reev1964'; type = 'Article'; bib = [ ... 
'author = {M. R. Reeve}, ' ... 
'year = {1964}, ' ...
'title = {Feeding of zooplankton, with special reference to some experiments with \emph{Sagitta}}, ' ...
'journal = {Nature}, ' ...
'volume = {201}, ' ...
'pages = {211--213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reev1970'; type = 'Incollection'; bib = [ ... 
'author = {M. R. Reeve}, ' ... 
'year = {1970}, ' ...
'title = {The biology of {C}haetognatha I. {Q}uantitative aspects of growth and egg production in \emph{Sagitta hispida}}, ' ...
'booktitle = {Marine Food Chains}, ' ...
'editor = {J. H. Steele}, ' ...
'publisher = {Univ. of California Press}, '...
'address = {Berkeley}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReevBake1975'; type = 'Article'; bib = [ ... 
'author = {M. R. Reeve and L. D. Baker.}, ' ... 
'year = {1975}, ' ...
'title = {Production of two planktonic carnivores (Chaetognath and Ctenophore) in south {F}lorida inshore waters}, ' ...
'journal = {Fish. Bull. (Dublin)}, ' ...
'volume = {73}, ' ...
'pages = {238--248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pear1991'; type = 'Incollection'; bib = [ ... 
'author = {Pearre, S.}, ' ... 
'year = {1991}, ' ...
'title = {Growth and reproduction}, ' ...
'booktitle = {The biology of Chaetognaths}, ' ...
'editor = {Bone, Q. and Kapp, H and Pierrot-Bults, A. C.}, ' ...
'publisher = {Oxford Sci Publ.}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beer1964'; type = 'Article'; bib = [ ... 
'author = {Beers, J. R.}, ' ... 
'year = {1964}, ' ...
'title = {Ammonia and Inorganic Phosphorus Excretion by the Planktonic Chaetognath, \emph{Sagitta hispida} {C}onant}, ' ...
'journal = {J. Cons. int. Explor. Mer}, ' ...
'volume = {29}, ' ...
'number = {2}, '...
'pages = {123--129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Chaetognatha/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
