function [data, auxData, metaData, txtData, weights] = mydata_Lipophrys_pholis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Blenniiformes'; 
metaData.family     = 'Blenniidae';
metaData.species    = 'Lipophrys_pholis'; 
metaData.species_en = 'Shanny'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 20];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';  bibkey.Lb  = 'fishbase'; 
data.Lp  = 6.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'FariAlma1996'; 
data.Li  = 16;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'EoL';

data.Wwb = 1.8e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm : pi/6*0.15^3';
data.Wwi = 38;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'EoL','fishbase'};
  comment.Wwi = 'based on W = 0.00930 * Li^3, see F2';

data.GSI  = 0.025; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'CarvMore2012';   
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% t-L data 
data.tL = [ ... % yr class (yr), total length (mm)
0.00	66.286
0.00	38.857
0.00	50.743
0.00	52.571
0.00	43.429
0.00	45.257
0.00	47.543
0.00	54.857
0.00	62.629
0.00	69.486
0.00	74.971
0.00	28.800
0.00	30.171
0.00	34.286
0.00	58.057
0.00	60.343
1	75.429
1	78.629
1	81.371
1	84.571
1	90.514
1	73.600
1	69.943
1	64.000
1	66.286
2	104.229
2	91.886
2	94.629
2	97.371
2	101.029
2	106.971
2	110.171
2	114.743
2	116.571
2	120.229
2	130.286
2	124.800
2	88.229
3	123.886
3	110.171
3	118.857
3	125.714
3	129.829
3	136.229
3	142.171
3	135.314
3	101.029
3	132.114
4	150.400
4	160.457
4	172.800
4	140.343];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL= 'CarvMore2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'range of depths: 0-20 m';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: W = 0.00930 * TL^3';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '72JQ3'; % Cat of Life
metaData.links.id_ITIS = '636404'; % ITIS
metaData.links.id_EoL = '46573609'; % Ency of Life
metaData.links.id_Wiki = 'Lipophrys_pholis'; % Wikipedia
metaData.links.id_ADW = 'Lipophrys_pholis'; % ADW
metaData.links.id_Taxo = '178995'; % Taxonomicon
metaData.links.id_WoRMS = '126768'; % WoRMS
metaData.links.id_fishbase = 'Lipophrys-pholis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lipophrys_pholis}}';
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
bibkey = 'CarvMore2012'; type = 'Misc'; bib = [ ... 
'author = {M. G. Carvalho and C. Moreira and S. Rodrigues and H. Queiroga and P. T. Santos and A. T. Correia}, ' ... 
'year = {2012}, ' ...
'title = {Age, growth and sex of \emph{Lipophrys pholis} from the North coast of {P}ortugal}, ' ...
'howpublished = {\url{http://www.fc.up.pt/pessoas/ptsantos/artigos/carvalhoetal2014PosterAgegrowthsex_Lipophrys_pholis.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FariAlma1996'; type = 'Article'; bib = [ ... 
'author = {C. Faria and V. C. Alamada and E. J. Goncalves}, ' ... 
'year = {1996}, ' ...
'title = {Juvenile recruitment, growth and maturation of \emph{Lipophrys pholis} ({P}isces: {B}lenniidae), from the west coast of {P}ortugal}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {49}, ' ...
'pages = {727-730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/9200}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lipophrys_pholis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/222239/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


