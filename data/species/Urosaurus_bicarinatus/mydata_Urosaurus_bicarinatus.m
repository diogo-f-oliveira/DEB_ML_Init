function [data, auxData, metaData, txtData, weights] = mydata_Urosaurus_bicarinatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Urosaurus_bicarinatus'; 
metaData.species_en = 'Tropical tree lizard'; 

metaData.ecoCode.climate = {'B', 'Cfa', 'Dfa', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-tL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 01];

%% set data
% zero-variate data

data.am = 5*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.2;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';    bibkey.Lb  = 'RamiHern2016';  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'RamiHern2016';  
data.Lpm  = 3.8;   units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'RamiHern2016';  
data.Li  = 4.4;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'RamiHern2016';
data.Lim  = 4.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';    bibkey.Lim  = 'RamiHern2016';

data.Wwi = 2.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'guess'; 
  comment.Wwi = 'base on LW data of Holbrookia_maculata given Li';

data.Ri  = 2*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'JoneBall1987';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch, 2 clutches per yr';
 
% univariate data
% time-length
data.LdL_f = [ ... % time since birth (mnth), SVL (cm)
2.20061	0.01723
2.29501	0.02539
2.90311	0.05364
3.15829	0.00812
3.15835	0.00904
3.40461	0.00661
3.55691	0.00281
3.74873	0.00534
3.79586	0.00844
3.85053	0.00694
3.95576	0.00130
4.04569	0.00084
4.15916	0.00141
4.26084	0.00118
4.29634	0.00577
4.54652	0.00347];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f   = C2K(30);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'RamiHern2016'; comment.LdL_f = 'Data for females';

data.LdL_m = [ ... % time since birth (mnth), SVL (cm)
2.29488	0.02332
2.30256	0.02114
2.45118	0.02102
2.95586	0.02284
3.10382	0.01249
3.25581	0.00397
3.39725	0.01362
3.45133	0.00328
3.50656	0.01052
3.75273	0.00683
3.86251	0.01085
4.01072	0.00441
4.15148	0.00360
4.19450	0.00348
4.24923	0.00302
4.26104	0.00417];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m   = C2K(30);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'RamiHern2016'; comment.LdL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f; weights.LdL_f(3)=0; % ignore outlier
weights.LdL_m = 3 * weights.LdL_m;
weights.Lb = 5 * weights.Lb;
weights.Li = 10 * weights.Li;
weights.Lim = 10 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assued to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7DYQZ'; % Cat of Life
metaData.links.id_ITIS = '586151'; % ITIS
metaData.links.id_EoL = '1055104'; % Ency of Life
metaData.links.id_Wiki = 'Urosaurus_bicarinatus'; % Wikipedia
metaData.links.id_ADW = 'Urosaurus_bicarinatus'; % ADW
metaData.links.id_Taxo = '627062'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Urosaurus&species=bicarinatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urosaurus_bicarinatus}}';
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
bibkey = 'RamiHern2016'; type = 'Article'; bib = [ ... 
'author = {Aurelio Ram\''{i}rez-Bautista and Uriel Hern\''{a}ndez-Salinas and J. Gast\''{o}n Zamora-Abrego}, ' ... 
'year = {2016}, ' ...
'title = {Growth ecology of the tree lizard \emph{Urosaurus bicarinatus} {S}quamata: {P}hrynosomatidae), in a tropical dry forest of the {C}hamela {R}egion, {M}exico}, ' ...
'journal = {Animal Biology}, ' ...
'volume = {66}, ' ...
'pages = {189–199}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

