function [data, auxData, metaData, txtData, weights] = mydata_Elaphe_climacophora

global tX2 tX4

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Elaphe_climacophora'; 
metaData.species_en = 'Japanese rat snake';

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 13];

%% set data
% zero-variate data

data.tp = 3.7*365;     units.tp = 'd';      label.tp = 'time since birth at puberty';     bibkey.tp = 'Fuka1978';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13.1*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 40;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';         bibkey.Lb  = 'Fuka1978';
data.Lp  = 108;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'Fuka1978';
data.Li  = 210;   units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'Fuka1978';
  
data.Ri  = 20/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm), hatch at time 0
0.044	39.164
1.527	67.356
2.035	85.551
2.181	118.399
2.601	123.396
2.633	105.802
2.749	134.837
2.780	131.319
2.780	126.627
2.828	112.258
2.842	116.071
2.899	134.841
2.929	136.015
2.930	133.082
3.112	123.116
3.664	148.058
3.740	142.781
3.786	136.331
3.920	143.959
4.941	147.505
5.603	146.643
5.691	160.722
5.781	157.498
5.843	148.996
6.998	164.276
7.388	168.978
7.673	166.347
8.320	160.792
8.679	171.652
8.754	174.586
10.736	184.317
10.767	181.092
11.007	185.204];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fuka1978';
comment.tL = '22.5-26.0C';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
     68    45
    118   180
    124   310
    135   340
    113   200
    149   480
    122   230
    145   325
    146   440
    131   250
    146   380
    135.5 400
    139   410
    160.5 1040
    142.5 345
    159   575
    158   900
    168   745
    163   680
    166   633
    172   690
    182   920
    185   870
    175   675
    182   890
    179  1175
    182  1255];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Fuka1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '38YKS'; % Cat of Life
metaData.links.id_ITIS = '1081811'; % ITIS
metaData.links.id_EoL = '794923'; % Ency of Life
metaData.links.id_Wiki = 'Elaphe_climacophora'; % Wikipedia
metaData.links.id_ADW = 'Elaphe_climacophora'; % ADW
metaData.links.id_Taxo = '49982'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Elaphe&species=climacophora'; % ReptileDB
metaData.links.id_AnAge = 'Elaphe_climacophora'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elaphe_climacophora}}';
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
bibkey = 'Fuka1978'; type = 'Article'; bib = [ ... 
'title = {Growth and Maturity of the {J}apanese Rat Snake, \emph{Elaphe climacophora} ({R}eptilia, {S}erpentes, {C}olubridae)}, ' ...
'journal = {Journal of Herpetology}, ' ...
'year = {1978}, ' ...
'author = {Hajime Fukada}, ' ....
'volume = {12(3)}, ' ...
'pages = {269-274}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794923}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elaphe_climacophora}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


