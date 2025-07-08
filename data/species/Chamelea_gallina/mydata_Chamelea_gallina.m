function [data, auxData, metaData, txtData, weights] = mydata_Chamelea_gallina
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Chamelea_gallina'; 
metaData.species_en = 'Striped venus clam'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 23]; 


%% set data
% zero-variate data

data.ab = 52/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 45*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.03;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'DelgSilv2013';
data.Li  = 4.4;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'BargVasa2020';

data.Wwb = 1.44e-07;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DelgSilv2013';
  comment.Wwb = 'Computed from guessed egg diameter of 65 mum: pi/6*0.0065^3';
data.Wwi = 19.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'Computed as 0.0002*(Li*10)^3.041, see F1';

data.Ri  = 797424/365; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate at SL 3 cm';   bibkey.Ri  = 'DelgSilv2013';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'partial fecundity; possibly more spawnings per yr';
  
% uni-variate data
% t-L data
data.tL = [ ... %  time since birth (yr), shell length (cm)
0.485	1.220
0.485	1.285
0.485	1.309
0.485	1.398
0.485	1.431
0.508	1.301
0.959	1.528
0.970	2.203
0.992	1.463
0.992	1.472
0.992	1.659
0.992	1.780
0.992	1.829
0.992	1.911
0.992	2.065
1.004	1.935
1.038	1.732
1.489	1.520
1.500	2.179
1.511	1.691
1.511	1.756
1.511	1.805
1.511	1.846
1.511	1.976
1.511	2.016
1.511	2.350
1.523	1.919
2.008	2.398
2.008	2.724
2.008	2.951
2.030	2.528
2.030	2.577
2.041	2.341
2.492	2.325
2.504	2.374
2.526	2.114
2.526	2.187
2.538	2.431
2.955	2.902
2.966	2.967
2.977	3.008
2.977	3.049
3.023	3.081
3.485	3.138
3.496	3.024
3.508	2.715
3.508	2.846
3.519	2.927
3.519	2.976
3.519	3.179
3.519	3.252
3.992	3.130
4.004	3.065
4.015	3.309
4.015	3.350
4.015	3.407
4.489	3.463
4.511	3.415
4.523	3.569
4.523	3.602
4.568	3.366
5.470	3.439
5.515	3.585
5.515	3.618
5.515	3.675
5.515	3.683
6.519	3.699];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BargVasa2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight (g)- shell length (mm): 0.0002*L^3.041';
metaData.bibkey.F1 = {'GaspSant2001'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TLLP'; % Cat of Life
metaData.links.id_ITIS = '205649'; % ITIS
metaData.links.id_EoL = '46469334'; % Ency of Life
metaData.links.id_Wiki = 'Chamelea_gallina'; % Wikipedia
metaData.links.id_ADW = 'Chamelea_gallina'; % ADW
metaData.links.id_Taxo = '39694'; % Taxonomicon
metaData.links.id_WoRMS = '141907'; % WoRMS
metaData.links.id_molluscabase = '141907'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chamelea_gallina}}';
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
bibkey = 'BargVasa2020'; type = 'Article'; bib = [ ... 
'author = {Giada Bargione and Claudio Vasapollo and Fortunata Donato and Massimo Virgili and Andrea Petetta and Alessandro Lucchetti}, ' ... 
'year = {2020}, ' ...
'title = {Age and Growth of Striped Venus Clam \emph{Chamelea gallina} ({L}innaeus, 1758) in the {M}id-{W}estern {A}driatic {S}ea: {A} Comparison of Three Laboratory Techniques}, ' ...
'doi = {10.3389/fmars.2020.582703}, ' ...
'journal = {Front. Mar. Sci.}, ' ...
'volume = {7}, ' ...
'pages = {582703}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DelgSilv2013'; type = 'Article'; bib = [ ... 
'author = {Marina Delgado and Luis Silva and Ana Ju\''{a}rez}, ' ... 
'year = {2013}, ' ...
'title = {Aspects of reproduction of striped venus \emph{Chamelea gallina} in the {G}ulf of C\''{a}diz ({S}{W} {S}pain): {I}mplications for fishery management}, ' ...
'doi = {10.1016/j.fishres.2013.04.005}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {146}, ' ...
'pages = {86-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaspSant2001'; type = 'Article'; bib = [ ... 
'author = {Gaspar, M. B. and Santos, M. N. and Vasconcelos, P.}, ' ... 
'year = {2001}, ' ...
'title = {Weight-length relationships of 25 bivalve species ({M}ollusca: {B}ivalvia) from the {A}lgarve coast (southern {P}ortugal)}, ' ...
'journal = {J Mar biol Ass UK}, ' ...
'volume = {81}, ' ...
'pages = {805-807}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
