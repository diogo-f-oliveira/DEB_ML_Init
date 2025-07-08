function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_catesbeianus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_catesbeianus'; 
metaData.species_en = 'American bullfrog'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFl', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 22];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '3 to 5 d';
data.tj = 365;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 2*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';   
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 7.00;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess';
  comment.Lj = 'based on tj and LL data';
data.Lp  = 15;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on tp and LL data';
data.Li  = 16.2;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 15.2;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'amphibiaweb';
  comment.Lim = 'Wiki states that males are bigger than females';

data.Wwb = 0.0018;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwi = 800;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
data.Wwim = 737; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Wwi*(Lim/Li)^3: 800*(15.2/16.5)';

data.Ri  = 2e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% initial length-length next yr
data.LL = [ ... % SVL (cm), SVL next yr (cm)
9.522	11.811
9.612	11.812
9.690	13.480
9.702	11.914
9.820	11.387
9.876	12.902
9.882	12.187
10.034	13.021
10.054	13.362
10.236	13.311
10.512	12.886
10.643	13.500
10.921	12.786
10.945	12.581
11.094	13.892
11.138	14.046
11.146	12.939
11.209	13.620
11.441	12.940
11.480	13.842
11.570	13.945
11.671	12.600
11.780	13.128
11.909	14.031
11.958	13.554
12.203	14.168
12.403	14.696
12.412	13.522
12.436	13.352
12.505	13.199
12.611	14.271
12.685	13.403
12.720	14.799
12.768	14.476
12.775	13.557
12.908	13.915
12.950	14.391
12.975	14.119
13.045	13.813
13.106	14.817
13.130	14.579
13.223	14.307
13.294	13.899
13.333	14.699
13.537	14.801
13.577	15.431
13.584	14.512
13.612	13.883
13.694	15.057
13.722	14.291
13.757	15.721
13.758	15.568
14.209	15.859];
units.LL  = {'cm', 'cm'};  label.LL = {'SVL', 'SVL next yr'};  
temp.LL   = C2K(15);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'BrunMagn1980';
comment.LL = 'data from Montreal';

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 50 * weights.LL;
weights.Lp = 0 * weights.Lp;
weights.Lj = 0 * weights.Lj;
weights.tp = 3 * weights.tp;
weights.tpm = 3 * weights.tpm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VHPT'; % Cat of Life
metaData.links.id_ITIS = '775084'; % ITIS
metaData.links.id_EoL = '330963'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_catesbeianus'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_catesbeianus'; % ADW
metaData.links.id_Taxo = '996551'; % Taxonomicon
metaData.links.id_WoRMS = '1116556'; % WoRMS
metaData.links.id_amphweb = 'Rana+catesbeiana'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lithobates_catesbeianus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_catesbeianus}}';
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
bibkey = 'BrunMagn1980'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z80-019}, ' ...
'author = {Bruneau, M. and Magnin, E.}, ' ... 
'year = {1980}, ' ...
'title = {Croissance, nutrition et reproduction des ouaouarons \emph{Rana catesbeiana} {S}haw ({A}mphibia {A}nura) des Laurentides au nord de {M}ontr\''{e}al}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {58(2)}, ' ...
'pages = {175–183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+catesbeiana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lithobates_catesbeianus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lithobates_catesbeianus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

