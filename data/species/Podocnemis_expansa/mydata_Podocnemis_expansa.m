function [data, auxData, metaData, txtData, weights] = mydata_Podocnemis_expansa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Podocnemididae';
metaData.species    = 'Podocnemis_expansa'; 
metaData.species_en = 'Arrau turtle'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFr', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biHs'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_e'; 't-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 28];

%% set data
% zero-variate data

data.ab = 59;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'MagaVogt2017';
  temp.ab = C2K(30.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ChinVale2008';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25.3*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki: possibly upto 80 yrs';
  
data.Lb = 5; units.Lb = 'cm';  label.Lb = 'carapace length at birth';     bibkey.Lb = 'Wiki';
data.Lp = 44.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for females';  bibkey.Lp = 'ChinVale2008';
data.Li = 107; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';  bibkey.Li = 'Wiki';
  comment.Li = 'mostly 64-71 cm';
data.Lim = 75; units.Lim = 'cm'; label.Lim = 'ultimate carapace length for males';  bibkey.Lim = 'Wiki';
  comment.Li = 'mostly 40-50 cm; max inferred from Li*50/71';

data.Ww0 = 39.16; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'MagaVogt2017';
data.Wwi = 9e4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';
 comment.Wwi = 'EoL gives 112 kg';

data.Ri = 100/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '75-123 eggs per clutch, 1 clutches per yr';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), carapace length (cm)
     5.5 44.5
    12   67.5
    12.5 70.0
    14   71.0];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time', 'carapace length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChinVale2008';

data.tLe_CRL = [ ... % age (d), crown-rump length (cm)
    0 0.180 
    1 0.398
    2 0.452
    3 0.485
    4 0.668
    5 0.708
    6 1.030
    7 1.443
    8 2.231
    9 2.286
   10 2.332
   11 2.408
   12 2.481
   13 2.640
   14 2.693
   15 2.695
   16 2.860]; 
units.tLe_CRL   = {'d', 'cm'};  label.tLe_CRL = {'time', 'embryo length', 'crown-rump length'};  
temp.tLe_CRL    = C2K(30.3);  units.temp.tLe_CRL = 'K'; label.temp.tLe_CRL = 'temperature';
bibkey.tLe_CRL = 'MagaVogt2017';
subtitle.tLe_CRL = 'Embryo development';

data.tLe_CL = [ ... % age (d), carapace length (cm)
   17 0.905
   18 0.917
   19 0.987
   20 1.001
   21 1.011
   22 1.062
   23 1.145
   24 1.173
   25 1.276
   26 1.297
   27 1.689
   28 1.709
   29 1.777
   30 2.010
   31 1.807
   32 2.228
   33 2.268
   34 2.469
   35 2.806
   36 2.904
   37 2.952
   38 3.107
   39 3.116
   40 3.330
   41 3.359
   42 3.510
   43 3.567
   44 3.818
   45 3.878
   46 3.895
   47 3.979
   48 4.044
   49 4.096
   50 4.277
   51 4.338
   52 4.424
   53 4.454
   54 4.531
   55 4.545
   56 4.647
   57 4.830
   58 5.175
   59 5.238
   60 5.811];   
units.tLe_CL   = {'d', 'cm'};  label.tLe_CL = {'time', 'embryo length', 'carapace length'};  
temp.tLe_CL    = C2K(30.3);  units.temp.tLe_CL = 'K'; label.temp.tLe_CL = 'temperature';
bibkey.tLe_CL = 'MagaVogt2017';
subtitle.tLe_CL = 'Embryo development';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri =  5 * weights.Ri;

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
txtData.subtitle = subtitle;

%% Group plots
set1 = {'tLe_CL','tLe_CRL'}; subtitle1 = {'Data for Carapace, Crown-Rump length'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '4KQG8'; % Cat of Life
metaData.links.id_ITIS = '202120'; % ITIS
metaData.links.id_EoL = '6868408'; % Ency of Life
metaData.links.id_Wiki = 'Podocnemis_expansa'; % Wikipedia
metaData.links.id_ADW = 'Podocnemis_expansa'; % ADW
metaData.links.id_Taxo = '48183'; % Taxonomicon
metaData.links.id_WoRMS = '1339079'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Podocnemis&species=expansa'; % ReptileDB
metaData.links.id_AnAge = 'Podocnemis_expansa'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podocnemis_expansa}}';
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
bibkey = 'MagaVogt2017'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00435-017-0365-8}, ' ...
'author = {Marcela S Magalh\={a}es and Richard C. Vogt and Ant\^{o}nio Sebben and Lucas Castanhola Dias and Moacir Franco de Oliveira and Carlos Eduardo B. de Moura}, ' ... 
'year = {2017}, ' ...
'title = {Embryonic development of the Giant {S}outh {A}merican River Turtle, \emph{Podocnemis expansa} ({T}estudines: {P}odocnemididae)}, ' ...
'journal = {Zoomorphology}, ' ...
'volume = {136}, ' ...
'pages = {523-537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChinVale2008'; type = 'Article'; bib = [ ... 
'author = {Anusuya Chinsamya and Nicole Valenzuela}, ' ... 
'year = {2008}, ' ...
'title = {Skeletochronology of the endangered side-neck turtle, \emph{Podocnemis expansa}}, ' ...
'journal = {South African Journal of Science}, ' ...
'volume = {104}, ' ...
'pages = {311-314}, ' ...
'howpublished = {\url{https://www.flmnh.ufl.edu/bulletin/publications/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Podocnemis_expansa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://eol.org/pages/6868408}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


