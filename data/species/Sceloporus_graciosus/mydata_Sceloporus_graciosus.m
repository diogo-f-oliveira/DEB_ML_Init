function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_graciosus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_graciosus';
metaData.species_en = 'Sagebrush swift';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'L0-Lt'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 05];

%% set data
% zero-variate data;
data.ab = 48;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'Burk1973';
temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.5;  units.Lb  = 'cm';  label.Lb  = 'SVL ate birth';   bibkey.Lb  = 'Burk1973';
  comment.Lb = '2.481 cm for females, 2.527 cm for males';
data.Lp  = 3.25; units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'Burk1973';
data.Li  = 7.5; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Burk1973';
  comment.Li = 'Wiki: 8.9 cm';
data.Lim = 6.0;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Wiki';

data.Wwb = 0.54; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Burk1973';
  comment.Wwb = '0.53 gm for females, 0.56 g for males';
data.Wwi = 7.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Burk1973';
data.Wwim = 6.1; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Burk1973';

% uni-variate data
% length-length
WLWLt = [... % weight (g), SVL (cm), dweight (g), dSVL (cm), time between meansurments (d), gender
2.29 3.90 2.77 1.30 72
4.92 4.30 1.40 1.20 80
1.93 4.10 3.67 1.60 68
1.62 3.20 2.43 1.40 60
3.06 4.80 2.39 0.70 67
2.55 4.60 3.29 0.80 86
2.42 4.35 4.08 1.30 72
2.95 4.50 2.97 0.80 61
3.59 4.55 2.97 1.15 59
3.21 4.50 2.34 1.00 58
2.89 4.20 2.44 1.20 65
1.68 3.70 4.28 1.50 95
2.28 5.23 5.23 1.95 97
2.12 4.00 4.22 1.90 68
2.42 4.15 3.42 1.55 96
2.33 4.20 2.98 1.40 95
2.87 4.30 2.09 1.20 56
2.65 4.20 3.49 1.50 74
3.32 4.80 2.90 1.00 76
2.62 4.40 3.78 1.40 73
4.20 5.20 2.17 0.80 49
4.36 5.15 1.52 0.55 60
2.65 4.20 3.49 1.50 76
1.94 3.90 3.66 1.70 63
4.68 5.30 1.59 0.60 50
2.90 4.50 2.36 1.10 74
3.17 4.50 0.46 0.40 38
2.91 4.40 2.82 1.10 90
3.47 4.70 3.38 1.10 80];
WLWLt(:,3:4) = WLWLt(:,1:2) + WLWLt(:,3:4);  % add increments to initial values
data.LdL = WLWLt(:,[2 4]); % 
growth.LdL = WLWLt(:,5); units.growth.LdL = 'd'; label.growth.LdL = 'days of growth';
units.LdL  = {'cm', 'cm'};  label.LdL = {'initial SVL', 'final SVL'};  
temp.LdL   = C2K(30);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Burk1973'; treat.LdL = {0, {'initial SVL','final SVL'}};

% weight-weight
data.WdW = WLWLt(:,[1 3]);
units.WdW  = {'g', 'g'};  label.WdW = {'initial weight', 'final weight'};  
temp.WdW   = C2K(30);  units.temp.WdW = 'K'; label.temp.WdW = 'temperature';
bibkey.WdW = 'Burk1973'; treat.WdW = {0, {'initial weight','final weight'}};

% length-weight
data.LW = [WLWLt(:,[2 1]);WLWLt(:,[4 2])]; 
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'Burk1973';

% length - fecundity
data.LN = [ ... % SVL (cm), yearly fecundity (#)
3.2	 1.477
3.5	 9.472
4.5	16.058
5.5	18.172
6.5	18.427];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'year fecundity'};  
temp.LN   = C2K(30);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Burk1973'; 

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.Li = 3 * weights.Li;
weights.Lb = 3 * weights.Lb;
weights.Lp = 3 * weights.Lp;
weights.ab = 0 * weights.ab;
% weights.Wwi = 0 * weights.Wwi;
% weights.Wwim = 0 * weights.Wwim;
% weights.Li = 0 * weights.Li;
% weights.Lim = 0 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.growth = growth;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4V59F'; % Cat of Life
metaData.links.id_ITIS = '173870'; % ITIS
metaData.links.id_EoL = '790737'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_graciosus'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_graciosus'; % ADW
metaData.links.id_Taxo = '573923'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=graciosus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_graciosus}}';   
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
bibkey = 'Burk1973'; type = 'phdthesis'; bib = [ ...  
'author = {Gary L. Burkholder}, ' ...
'title = {Life history and ecology of the Great Basin sagebrush swift, \emph{Sceloporus graciosus graciosus} Baird and Girard, 1852}, ' ...
'school = {Brigham Young University - Provo}, ' ...
'howpublish = {\url{https://scholarsarchive.byu.edu/cgi/viewcontent.cgi?article=8647&context=etd}}, ' ...
'year = {1973}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

