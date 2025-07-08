function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_marginatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_marginatus'; 
metaData.species_en = 'Dusky grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dorra Louati'};    
metaData.date_subm = [2013 04 11];              
metaData.email    = {'dorra.louati@gmail.com'};            
metaData.address  = {'University of Tunis'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2013 05 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 13]; 


%% set data
% zero-variate data

data.ab = 1 + 80/24; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'GlamSkar1998';   
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = 1827;      units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'RenoGrau2010';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 50 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Goth1991';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.295;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'GlamSkar1998';  
data.Lp  = 45;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'RenoGrau2010'; 
data.Li  = 150;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Goth1991';

data.Wwb = 1.48e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Cunha2009';
data.Wwp = 500;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Cunha2009';
data.Wwi = 12000;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Heemstra1993';

data.R92  = 8e6/365; units.R92  = '#/d'; label.R92  = 'reprod rate at TL = 92 cm'; bibkey.R92  = 'RenoGrau2010';   
temp.R92 = C2K(23);  units.temp.R92 = 'K'; label.temp.R92 = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
0.989	26.059 
2.045	30.894
3.019	32.408
3.020	34.198
3.022	36.754
3.023	39.567
3.027	46.726
3.071	30.873
4.001	46.449
4.003	49.262
4.018	31.108
4.023	38.778
4.024	40.568
4.025	42.358
4.026	44.148
4.026	44.915
4.046	33.153
4.047	34.943
4.048	36.988
4.070	29.062
5.001	46.939
5.022	36.967
5.023	39.524
5.024	40.803
5.024	41.570
5.028	47.962
5.028	48.473
5.029	49.496
5.031	52.052
5.043	28.274
5.044	30.831
5.046	34.154
5.052	43.359
5.052	44.382
6.003	50.242
6.004	51.265
6.004	52.287
6.027	45.895
6.028	47.429
6.029	48.963
6.032	54.077
6.039	67.116
6.051	41.548
6.051	42.570
6.052	43.593
6.087	59.189
6.088	60.723
6.113	57.399
7.029	49.453
7.031	52.777
7.032	54.311
7.033	55.334
7.060	57.890
7.062	60.958
7.064	63.515
8.035	59.659
10.041	69.843
10.042	72.145
11.047	79.538];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SeybCond2011';
comment.tL = 'temp is guessed';
  
%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6FTQB'; % Cat of Life
metaData.links.id_ITIS = '551037'; % ITIS
metaData.links.id_EoL = '46579613'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_marginatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_marginatus'; % ADW
metaData.links.id_Taxo = '173912'; % Taxonomicon
metaData.links.id_WoRMS = '127036'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-marginatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_marginatus}}';
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
bibkey = 'Goth1991'; type = 'Book'; bib = [ ... 
'author = {G"{o}thel, H.}, ' ... 
'year = {1992}, ' ...
'title = {Fauna marina del {M}editerr\''{a}neo.}, ' ...
'publisher = {Ediciones Omega, S.A.}, ' ...
'address = {Barcelona}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RenoGrau2010'; type = 'Article'; bib = [ ... 
'author = {Re\~{n}ones, O. and Grau, A. and Mas, X. and Riera, F. and Saborido-Rey, F.}, ' ... 
'year = {2010}, ' ...
'title = {Reproductive pattern of an exploited dusky grouper \emph{Epinephelus marginatus} ({L}owe 1834) ({P}isces: {S}erranidae) population in the western {M}editerranean}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {74}, ' ...
'number = {3}, '...
'pages = {523-537}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Heemstra1993'; type = 'Article'; bib = [ ... 
'author = {Heemstra, P. C. and J. E. Randall}, ' ... 
'year = {1993}, ' ...
'title = {Groupers of the world (family {S}erranidae, subfamily {E}pinephelinae). {A}n annotated and illustrated catalogue of the grouper, rockcod, hind, coral grouper and lyretail species known to date}, ' ...
'journal = {FAO Species Catalogue. Vol. 16. Rome: FAO. FAO Fish. Synop.}, ' ...
'volume = {125}, ' ...
'number = {16}, '...
'pages = {1--382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cunha2009'; type = 'Article'; bib = [ ... 
'author = {Cunha, M. and Quental and H. and Barradas, A. and Pouso\~{a}-Ferreira, P. and Cabrita, E. and Engrola, S.}, ' ... 
'year = {2009}, ' ...
'title = {Rearing larvae of dusky grouper, \emph{Epinephelus marginatus} ({L}owe, 1834), ({P}isces: {S}erranidae) in a semi-extensive mesocosm}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {73}, ' ...
'number = {S1}, '...
'pages = {201--212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlamSkar1998'; type = 'Article'; bib = [ ... 
'author = {Glamuzina, B. and Skaramuca, B. and Glavic, N. and Kozvul, V. and Dulcic, J. and Kraljevic, M.}, ' ... 
'year = {1998}, ' ...
'title = {Egg and early larval development of laboratory reared dusky grouper, \emph{Epinephelus marginatus} ({L}owe, 1834) ({P}icies, {S}erranidae)}, ' ...
'journal = {Scientia Marina}, ' ...
'volume = {62}, ' ...
'number = {4}, '...
'pages = {373--378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeybCond2011'; type = 'Article'; bib = [ ... 
'author = {E. Seyboth and M. V. Condini and C. Q. Albuquerque and A. S. Varela and G. Velasco and J. P. Vieira and A. M. Garcia}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth, and reproductive aspects of the dusky grouper \emph{Mycteroperca marginata} ({A}ctinopterygii: {E}pinephelidae) in a man-made rocky habitat in southern {B}razil}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {9}, ' ...
'pages = {849--856}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-marginatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

