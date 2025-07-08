function [data, auxData, metaData, txtData, weights] = mydata_Abatus_cordatus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Spatangoida'; 
metaData.family     = 'Schizasteridae';
metaData.species    = 'Abatus_cordatus';  
metaData.species_en = 'Kerguelen sea urchin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MIS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwj'; 'Wwp'; 'Ww_t'; 'GSI'};
metaData.data_1     = {'t-L_e'; 't-L';' L-Ww_e'; 'L-Ww'; 'L-JO'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Charlene Guillaumot'};            
metaData.date_subm = [2019 01 17];                       
metaData.email    = {'charleneguillaumot21@gmail.com'};              
metaData.address  = {'ULB, 1050 Brussels, BELGIUM'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 01 17]; 

%% set data
data.tj = 142;       units.tj = 'd';          label.tj = 'age at metam';   bibkey.tj ='Scha1985';    
  temp.tj = C2K(5);  units.temp.tj = 'K';     label.temp.tj = 'temperature';
data.ap = 36*30.5;     units.ap = 'd';        label.ap = 'age at puberty'; bibkey.ap ='Mesp1992'; 
  temp.ap = C2K(5);    units.temp.ap = 'K';   label.temp.ap = 'temperature';
data.am = 6*365;     units.am = 'd';      label.am = 'life span';      bibkey.am ='Mesp1992';
  temp.am = C2K(5);      units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '5 to 6 years';
 
%data.L0  = 0.116;   units.L0  = 'cm';   label.L0  = 'diameter of the egg';    bibkey.L0  = 'Scha1985'; comment.L0 = 'station Anse du Halage'; 
data.Lj  = 0.276;   units.Lj  = 'cm';    label.Lj  = 'length at metam';      bibkey.Lj  = 'Scha1985'; comment.Lj = 'station Anse du Halage'; 
data.Lp  = 1.9;     units.Lp  = 'cm';    label.Lp  = 'length at puberty';    bibkey.Lp  = 'Mesp1992'; comment.Lp = 'station  Anse du Halage';
data.L6  = 4.2;     units.L6  = 'cm';    label.L6  = 'max observed length';  bibkey.L6  = 'Mesp1992'; comment.L6 = 'station Anse du Halage';
data.Li  = 8;       units.Li  = 'cm';    label.Li  = 'ultimate max length';  bibkey.Li  = 'guess'; 

data.Ww0 = 1.777e-3 ;   units.Ww0 = 'g'; label.Ww0 = 'Wet weight of the egg';  bibkey.Ww0 = 'Scha1985';       
  comment.Ww0 = 'station: Anse du Halage';
data.Wwj = 10.3e-3 ;   units.Wwj = 'g'; label.Wwj = 'Wet weight at metam';    bibkey.Wwj = 'Scha1985';       comment.Wwj = 'station: Anse du Halage';
data.Wwp = 2.9;         units.Wwp = 'g'; label.Wwp = 'Wet weight at puberty';  bibkey.Wwp = 'FeraMagn1988';   comment.Wwp = 'station: Anse du Halage';
data.Ww6 = 25;          units.Ww6 = 'g'; label.Ww6 = 'max observed wet weight'; bibkey.Ww6 = 'FeraMagn1988';   comment.Ww6 = 'station: Anse du Halage guessed from the publication, not real data';

% GSI value after 10 months energy accumulation at Anse du Halage 
data.GSI = 0.07;    units.GSI  = '-';     label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Magn1983';  
temp.GSI = C2K(5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
comment.GSI = 'station Anse du Halage for females';

%data.Ri  = 27.3;    units.Ri  = '#/year';  label.Ri  = 'maximum reprod
%rate'; bibkey.Ri  = 'Magn1983'; %temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
%comment.Ri = 'average number of eggs inside 60 brooding females at  station Anse du Halage';
 
%---------------------------------------
% uni-variate data
%_______________________________________
% time, length (before metam) 
%  data.tL_egg = [... time (days), length (mm)
%  0	   1.160
%  5     1.24
%  19    1.24
%  23    1.24
%  33    1.26
%  42    1.26
%  51    1.26
%  60    1.26
%  74    1.24
%  90    1.24
%  106   1.24
%  122   1.24
%  142   1.39]; 
%  data.tL_egg(:,2) = data.tL_egg(:,2)/10; % conver mm to cm
%  units.tL_egg= {'days','cm'}; label.tL_egg = {'time', 'egg diameter'}; 
%  temp.tL_egg = C2K(5); units.temp.tL_egg = 'K'; label.temp.tL_egg = 'temperature'; 
%  bibkey.tL_egg= 'SchaFera1996';

 % time, length (post metam)
data.tL = [... time (days), length (mm)
142     1.39
186     1.75
212     1.95
230     1.95
260     2.45
365.67	5.07
483	    7.68
728.88	10.95
1075.53	19.82
1451.58	27.47
1801.83	34.42]; 
data.tL(:,2) = data.tL(:,2)/10; % conver mm to cm
units.tL= {'d','cm'}; label.tL = {'time since birth', 'length'}; 
temp.tL = C2K(5); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL= {'Mesp1992', 'Scha1985'};comment.tL = 'station: Anse du Halage';

% length ~ wet weight (before metam)
data.LW_egg = [... length (mm), Ww (g)
1.160 1.777e-3
1.24  2.426e-3
1.26  3.206e-3
1.24  2.079e-3
1.39  3.007e-3]; 
data.LW_egg(:,1) = data.LW_egg(:,1)/ 10; % convert mm to cm
units.LW_egg = {'cm','g'}; label.LW_egg = {'egg diameter', ' egg wet weight'}; 
bibkey.LW_egg ='Scha1985';comment.LW_egg = 'station: Anse du Halage';

% length ~ wet weight (after metam)
data.LW = [... length (mm),Ww(g) 
1.39    0.766e-3
1.95    1.476e-3
2.45    2.429e-3
2.42	6.9e-3
2.76	10.3e-3
11	    0.46
12.5	0.75
14	    1
15.5	1.4
18	    2.16
20.5	3.14
23	    4.47
23.5	4.8
25	    5.9
28	    8.88
35	    14.41
39	    23.35
32	    12.3
35	    15.9
37	    17.9
34	    15.1
34	    15.25
39	    22.1
37	    20.65]; 
data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
units.LW= {'cm','g'}; label.LW = {'length','Wet Weight adult'}; 
temp.LW = C2K(5); units.temp.LW = 'K'; label.temp.LW = 'temperature'; 
bibkey.LW= {'FeraMagn1988', 'Dubo2018'}; 
comment.LW = 'station: Anse du Halage, only males were selected when adult';

% Oxygen consumption starved individual
data.LJO = [... length (mm), oxygen consumed (ul/h)
2.42	1.48
2.76	1.78
11	    17.4
12.5	34.6
14	    35.1
15.5	45.6
18      51.4
20.5	56.1
23	    70.8
23.5	118.2
25	    125.6
28	    122.7
35	    111.2
39	    182.2]; 
data.LJO(:,1) = data.LJO(:,1)/ 10; % convert mm to cm
units.LJO= {'cm','\mul/h'}; label.LJO= {'length', 'O_2 consumption'};  
bibkey.LJO= {'FeraMagn1988'};temp.LJO = C2K(9); units.temp.LJO = 'K'; label.temp.LJO = 'temperature'; % station= Anse du Halage
comment.LJO = 'station Anse du Halage';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwj = 0 * weights.Wwj;
weights.Ww0 = 5 * weights.Ww0;
weights.Lj = 10 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'End of acceleration is assumed to coincide with leaving the mother';
D2 = 'Egg production is assumed to occur once per yr';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = ['the larvae stay in the mother incubation pouches during 8.5 months. After that, the juvenile (a little well developed sea  urchin) goes outside; '...
    'feeding situation inside the mother is not clear; possible epidermal uptake of DOM, Schatt et Feral 1996'];
metaData.bibkey.F1 = 'Scha1985'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '63YSM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3039339'; % Ency of Life
metaData.links.id_Wiki = 'Abatus_cordatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3925637'; % Taxonomicon
metaData.links.id_WoRMS = '160763'; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Mesp1992'; type = 'phdthesis'; bib = [ ... 
'author = {Mespoulh\''{e}, Philippe}, ' ... 
'year = {1992}, ' ...
'title = {Morphologie d'' un echinide irregulier subantarctique de l'' archipel des {K}erguelen: ontogenese, dimorphisme sexuel et variabilit\''{e}}, ' ...
'school = {Universit\''{e} de Bourgogne}, ' ...
'pages = {197pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Scha1985'; type = 'phdthesis'; bib = [ ... 
'author = {Schaat, Philippe}, ' ... 
'year = {1985}, ' ...
'title = {D\''{e}veloppement et croissance embryonnaire de l'' oursin incubant \emph{Abatus cordatus} ({E}chinoidea: {S}patangoida)}, ' ...
'school = {Universit\''{e} Pierre et Marie Curie}, ' ...
'pages = {159pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FeraMagn1988'; type = 'Incollection'; bib = [ ... 
'author = {F\''{e}ral, J. P. and Magniez, P.}, ' ... 
'year = {1988}, ' ...
'title = {Relationship between rates of oxygen consumption and somatic and gonadal size in the subantarctic edinoid \emph{Abatus cordatus} from {K}erguelen}, ' ...
'editor = {Burke et al.}, ' ...
'booktitle = {Echinoderm Biology}, ' ...
'isbn = {90 6191 755 7}, ' ...
'volume = {2}, '...
'pages = {581-587}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Magn1983'; type = 'Article'; bib = [ ... 
'author = {Magniez, P.}, ' ... 
'year = {1983}, ' ...
'title = {Reproductive cycle of the brooding echinoid \emph{Abatus cordatus} ({E}chinodermata) in {K}erguelen ({A}ntarctic {O}cean): changes in organ indices, biochemical composition and caloric content of the gonads}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {74}, ' ...
'pages = {55-64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dubo2018'; type = 'Misc'; bib = [ ...
'author = {Dubois, Philippe}, ' ...
'note = {Experiments at Kerguelen}, ' ...
'year = {2018}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

