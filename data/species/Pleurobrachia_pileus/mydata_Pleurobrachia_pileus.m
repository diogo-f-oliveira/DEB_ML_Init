function [data, auxData, metaData, txtData, weights] = mydata_Pleurobrachia_pileus

%% set metaData
metaData.phylum     = 'Ctenophora'; 
metaData.class      = 'Tentaculata'; 
metaData.order      = 'Cydippida'; 
metaData.family     = 'Pleurobrachiidae';
metaData.species    = 'Pleurobrachia_pileus'; 
metaData.species_en = 'Sea gooseberry'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'; 'RQ'}; 
metaData.data_1     = {'t-L_T'; 'L-F'; 'Ww-JO_T'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Vania Freitas','Lodewijk van Walraven'};    
metaData.date_subm = [2010 09 01];              
metaData.email    = {'Lodewijk.van.Walraven@nioz.nl'};            
metaData.address  = {'NIOZ, Texel'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2010 10 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Starrlight Augustine'};    
metaData.date_mod_2 = [2013 06 20];              
metaData.email_mod_2    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_2  = {'Akvaplan-niva AS, Fram Centre, P.O. Box 6606 Langnes, 9296 Tromso, Norway'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 


%% set data
% zero-variate data

data.ab = 2;     units.ab = 'd';     label.ab = 'age at birth';             bibkey.ab = 'Grev1972';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Greve70 gives 1 d at 15 C, Greve72 2 d at 13 and 18 C';
data.am = 250;   units.am = 'd';     label.am = 'life span';                bibkey.am = 'Grev1971';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.0226; units.Lb  = 'cm'; label.Lb  = 'polar length at birth';   bibkey.Lb  = 'Grev1975';
  comment.Lb = 'Grev1975: diameter at birth is 0.0125 cm';
data.Lp  = 0.69; units.Lp  = 'cm';   label.Lp  = 'polar length at puberty'; bibkey.Lp  = 'Grev1971';
data.Li  = 3.1;  units.Li  = 'cm';   label.Li  = 'ultimate polar length';   bibkey.Li  = 'Walr2009';

data.Wdi = 0.394;   units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'MollCano2010';
  comment.Wdi = 'using MutlBing1999 equation for L = 3.1 cm: W = 0.682 L^2.522 Length (mm)- weight (mg), see MollCano2010';
  
data.Ri  = 1196; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Grev1972'; 
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Grev1972: 7075 #/d for a 15 mm individual';

data.RQ  = 0.74; units.RQ  = '-';    label.RQ  = 'repiratory quotient';     bibkey.RQ  = 'MollCano2010';   

% uni-variate data

% Size-dependent feeding experiments  at 15 C
data.LCR = [... % Polar length (mm) Clearance rate (l/d)
 3.220	 1.147;
 3.256	 1.720;
 3.470	 1.864;
 4.651	 5.090;
 6.977	 9.032;
 7.299	 8.960;
 8.050	 9.319;
10.662	17.061;
12.308	19.355;
16.315	34.982];
data.LCR(:,1) = data.LCR(:,1)/ 10; % convert length to cm
units.LCR   = {'cm', 'l/d'};  label.LCR = {'polar length', 'clearance rate'};  
temp.LCR    = C2K(15);  units.temp.LCR = 'K'; label.temp.LCR = 'temperature';
bibkey.LCR = 'MollCano2010';
comment.LCR = 'clearance rates only the ones they used in their regression';
				
% Growth curves under lab conditions at different temperatures 
TtL = [... % C, d, diameter mm
6	0	3.292;
6	1	3.332;
6	2	3.545;
6	3	3.715;
6	4	3.885;
6	6	4.182;
6	7	4.482;
6	8	4.696;
6	10	4.862;
6	12	5.116;
6	15	5.323;
6	16	5.623;
6	17	6.009;
10	0	3.465;
10	1	3.549;
10	2	3.632;
10	3	3.932;
10	4	4.232;
10	5	4.489;
10	6	4.702;
10	7	4.915;
10	8	5.172;
10	11	5.423;
10	12	5.636;
10	13	6.023;
10	14	6.323;
10	15	6.623;
10	16	6.793;
10	17	7.18;
15	0	3.552;
15	3	4.322;
15	6	5.655;
15	8	6.515;
15	10	7.332;
15	11	7.416;
15	12	7.716;
15	13	8.363;
15	14	8.793;
15	15	9.049;
15	17	9.65;
20	0	3.638;
20	2	4.369;
20	3	5.059;
20	4	5.922;
20	5	6.829;
20	6	7.822;
20	7	8.426;
20	9	9.286;
20	10	9.889;
20	11	10.836;
20	12	11.223;
20	14	11.653;
20	15	11.866;
20	16	11.949;
20	17	12.293];
TtL(:,3) = TtL(:,3) * 1.25/ 10; % convert diameter in mm to polar length in cm
data.tL_6 = TtL(1:13,[2 3]); % T = 273 + 6
units.tL_6  = {'d', 'cm'};  label.tL_6 = {'time since birth', 'polar length', '6 C'};  
temp.tL_6   = C2K(6);  units.temp.tL_6 = 'K'; label.temp.tL_6 = 'temperature';
bibkey.tL_6 = 'Grev1972';
%
data.tL_10 = TtL(14:29,[2 3]); % T = 273 + 10
units.tL_10  = {'d', 'cm'};  label.tL_10 = {'time since birth', 'polar length', '10 C'};  
temp.tL_10   = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'Grev1972';
%
data.tL_15 = TtL(30:40,[2 3]); % T = 273 + 15
units.tL_15  = {'d', 'cm'};  label.tL_15 = {'time since birth', 'polar length', '15 C'};  
temp.tL_15   = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature';
bibkey.tL_15 = 'Grev1972';
%
data.tL_20 = TtL(41:55,[2 3]); % T = 273 + 20
units.tL_20  = {'d', 'cm'};  label.tL_20 = {'time since birth', 'polar length', '20 C'};  
temp.tL_20   = C2K(20);  units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature';
bibkey.tL_20 = 'Grev1972';

% Dioxygen consumption data at various Temperatures and body masses (wet mass) 
TWJO = [... % C, g, muL O2 h-1
2	0.066240717	0.795;2	0.084995553	1.071;2	0.149895194	1.814;2	0.179783	2.035;2	0.205996114	2.334;2	0.270750911	2.444;8	0.038240805	1.257;
8	0.094860778	2.5;8	0.116215003	3.864;8	0.136291692	4.045;8	0.187364665	4.859;8	0.897217987	19.212;12	0.034048046	1.943;
12	0.048957365	2.678;12	0.191339325	7.011;12	0.71399394	21.056;12	0.799567489	24.719;18	0.064260021	3.691;18	0.084355357	4.972;
18	0.178328101	10.59;18	0.322071917	14.594;18	0.422742146	20.113;18	0.568058487	24.159;18	0.89448818	35.665;24	0.03313448	4.749;
24	0.047590015	8.23;24	0.280296171	22.555;24	0.505490539	41.869;24	0.814228521	63.24];
data.WJO_2 = TWJO(1:6, [2 3]);    % T = 273 + 2
units.WJO_2  = {'g', 'muL O2/h'};  label.WJO_2 = {'wet weight', 'O_2 consumption', '2 C'};  
temp.WJO_2   = C2K(2);  units.temp.WJO_2 = 'K'; label.temp.WJO_2 = 'temperature';
bibkey.WJO_2 = 'GyllGrev1979';
%
data.WJO_8 = TWJO(7:12, [2 3]);   % T = 273 + 8
units.WJO_8  = {'g', 'muL O2/h'};  label.WJO_8 = {'wet weight', 'O_2 consumption', '8 C'};  
temp.WJO_8   = C2K(8);  units.temp.WJO_8 = 'K'; label.temp.WJO_8 = 'temperature';
bibkey.WJO_8 = 'GyllGrev1979';
%
data.WJO_12 = TWJO(13:17, [2 3]); % T = 273 + 12
units.WJO_12  = {'g', 'muL O2/h'};  label.WJO_12 = {'wet weight', 'O_2 consumption', '12 C'};  
temp.WJO_12   = C2K(12);  units.temp.WJO_12 = 'K'; label.temp.WJO_12 = 'temperature';
bibkey.WJO_12 = 'GyllGrev1979';
%
data.WJO_18 = TWJO(18:24, [2 3]); % T = 273 + 18
units.WJO_18  = {'g', 'muL O2/h'};  label.WJO_18 = {'wet weight', 'O_2 consumption', '18 C'};  
temp.WJO_18   = C2K(18);  units.temp.WJO_18 = 'K'; label.temp.WJO_18 = 'temperature';
bibkey.WJO_18 = 'GyllGrev1979';
%
data.WJO_24 = TWJO(25:29, [2 3]); % T = 273 + 24
units.WJO_24  = {'g', 'muL O2/h'};  label.WJO_24 = {'wet weight', 'O_2 consumption', '24 C'};  
temp.WJO_24   = C2K(24);  units.temp.WJO_24 = 'K'; label.temp.WJO_24 = 'temperature';
bibkey.WJO_24 = 'GyllGrev1979';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_6 = 10 * weights.tL_6;
weights.tL_10 = 10 * weights.tL_10;
weights.tL_15 = 10 * weights.tL_15;
weights.tL_20 = 10 * weights.tL_20;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_20','tL_15','tL_10','tL_6'}; subtitle1 = {'Data at 20,15,10,6 C'};
set2 = {'WJO_24','WJO_18','WJO_12','WJO_8','WJO_2'}; subtitle2 = {'Data at 24,18,12,8,2 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Chemical pars are assumped to relate to ash-free dry mass';
D2 = ' Ash free dry mass over dry mass ratio is reported to be 0.263 - 0.297 with mean 0.279, which makes del_W = 3.5842';
metaData.bibkey.D2 = 'MaleFaga1993'; 
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Simulateneous hermaphrodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '77S47'; % Cat of Life
metaData.links.id_ITIS = '53862'; % ITIS
metaData.links.id_EoL = '45502527'; % Ency of Life
metaData.links.id_Wiki = 'Pleurobrachia_pileus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '12311'; % Taxonomicon
metaData.links.id_WoRMS = '106386'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pleurobrachia_pileus}}';
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
bibkey = 'MollCano2010'; type = 'Article'; bib = [ ... 
'author = {M{\o}ller, L. F. and Canon, J. M. and Tiselius, P.}, ' ... 
'year = {2010}, ' ...
'title = {Bioenergetics and growth in the ctenophore \emph{Pleurobrachia pileus}}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {645}, ' ...
'pages = {167--178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MutlBing1999'; type = 'Article'; bib = [ ... 
'author = {Mutlu, E. and Bingel, F.}, ' ... 
'year = {1999}, ' ...
'title = {Distribution and abundance of ctenophores, and their zooplankton food in the {B}lack {S}ea. I. \emph{Pleurobrachia pileus}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {135}, ' ...
'pages = {589--601}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grev1971'; type = 'Article'; bib = [ ... 
'author = {Greve, W.}, ' ... 
'year = {1971}, ' ...
'title = {Okologische {U}ntersuchungen an \emph{Pleurobrachia pileus} 1. {F}reilanduntersuchungen}, ' ...
'journal = {Helgol.Wiss. Meeresunters}, ' ...
'volume = {22}, ' ...
'pages = {303--325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grev1972'; type = 'Article'; bib = [ ... 
'author = {Greve, W.}, ' ... 
'year = {1972}, ' ...
'title = {Okologische {U}ntersuchungen an \emph{Pleurobrachia pileus} 2. {L}aboratoriumuntersuchungen}, ' ...
'journal = {Helgol. Wiss. Meeresunters.}, ' ...
'volume = {23}, ' ...
'pages = {141--164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grev1975'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ices.dk/sites/pub/Publication~Reports/Plankton~leaflets/SHEET146.PDF}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GyllGrev1979'; type = 'Article'; bib = [ ... 
'author = {Gyllenberg, F. and Greve, W.}, ' ... 
'year = {1979}, ' ...
'title = {Studies on oxygen uptake in ctenophores}, ' ...
'journal = {Annals zool. fenn.}, ' ...
'volume = {16}, ' ...
'pages = {44--49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Walr2009'; type = 'Misc'; bib = [ ...
'author = {Walraven, L. van}, ' ...     
'note = {original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaleFaga1993'; type = 'Article'; bib = [ ... 
'author = {Malej, A. and Faganeli, J. and Pezdic, J.}, ' ... 
'year = {1993}, ' ...
'title = {Stable isotope and biochemical fractionation in the marine pelagic food chain: the jellyfish \emph{Pelagia noctiluca} and net zooplantkton}, ' ...
'journal = {Marine  Biology}, ' ...
'volume = {116}, ' ...
'pages = {565--570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

