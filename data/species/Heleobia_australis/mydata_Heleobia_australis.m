function [data, auxData, metaData, txtData, weights] = mydata_Heleobia_australis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Cochliopidae';
metaData.species    = 'Heleobia_australis'; 
metaData.species_en = 'Mud-snail'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 28]; 

%% set data
% zero-variate data

data.am = 4*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'CarcFior2012';   
  temp.am = C2K(15.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.35;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 0.7;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'CarcFior2012';

data.Wwb = 1.1e-7; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NeveLoui2010';
  comment.Wwb = 'Based on egg diameter of 60 mum: pi/6*0.006^3';
data.Wwi = 0.0311;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on volume estimate from photo';

data.Ri  = 2.8e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
0.139	0.155
0.156	0.170
0.282	0.275
0.303	0.232
0.319	0.221
0.647	0.275
0.659	0.310
0.814	0.265
0.819	0.329
0.974	0.315
0.990	0.330
1.154	0.355
1.158	0.304
1.285	0.357
1.302	0.445
1.326	0.361
1.486	0.459
1.506	0.369
1.645	0.464
1.825	0.445
1.834	0.460
1.973	0.473
1.997	0.463
2.153	0.478
2.154	0.459
2.288	0.501
2.317	0.506
2.488	0.502
2.660	0.523];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'CarcFior2012';
comment.tL = 'temperature varies between 7.6 and 23.6 C: 15.3+8*sin(2*pi*(t-t_0)/365)';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki_nl'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6LHWQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4860343'; % Ency of Life
metaData.links.id_Wiki = 'Heleobia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3960327'; % Taxonomicon
metaData.links.id_WoRMS = '532899'; % WoRMS
metaData.links.id_molluscabase = '532899'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heleobia}}';
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
bibkey = 'CarcFior2012'; type = 'Article'; bib = [ ... 
'author = {M. C. Carcedo and S. M. Fiori}, ' ... 
'year = {2012}, ' ...
'title = {Long-term study of the life cycle and growth of \emph{Heleobia australis} ({C}aenogastropoda, {C}ochliopidae) in the {B}ah\''{i}a {B}lanca estuary, {A}rgentina}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {38}, ' ...
'pages = {589-597}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NeveLoui2010'; type = 'Article'; bib = [ ... 
'author = {Raquel A. F. Neves and Jean Louis Valentin and Gisela M. Figueiredo}, ' ... 
'year = {2010}, ' ...
'title = {MORPHOLOGICAL DESCRIPTION OF THE GASTROPOD \emph{Heleobia australis} ({H}YDROBIIDAE) FROM EGG TO HATCHING}, ' ...
'journal = {BRAZILIAN JOURNAL OF OCEANOGRAPHY}, ' ...
'volume = {58}, ' ...
'pages = {247-250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
